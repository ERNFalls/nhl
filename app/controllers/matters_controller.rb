class MattersController < ApplicationController
  
  layout "main"

  #Documented Bug with CanCan - Devise that consumed an hour of my life. The workaround is just to "except: [:create]" as below. 2/15/14 - EES
  load_and_authorize_resource except: [:create]

  def show
    @matter = Matter.find(params[:id])
    @able = @matter
    @templates = Template.where({:template_type => "General"})
    
    unless @matter.case_no.to_s.empty?
	  unless Gem.win_platform?
	    begin
	      agent = Mechanize.new
	      page = agent.get("https://www2.miami-dadeclerk.com/civil/search.aspx")
	      form = page.form("aspnetForm")
	      form.add_field!("__EVENTARGUMENT", "")
	      form.add_field!("__EVENTTARGET", "ctl00$ContentPlaceHolder1$TabMenu1$lnkpnlSearch2")
	      docket_search_page = agent.submit(form)
	      docket_search_page.form["ctl00$ContentPlaceHolder1$txtLCNYearSTD"] = @matter.case_year
	      docket_search_page.form["ctl00$ContentPlaceHolder1$txtLCNSeqSTD"] = @matter.case_sequence
	      docket_search_page.form["ctl00$ContentPlaceHolder1$txtLCNCodeSTD"] = @matter.case_code
	      docket_search_page.form["ctl00$ContentPlaceHolder1$txtLCNLocSTD"] = @matter.case_location
	      docket_search_page.form.add_field!("__EVENTARGUMENT", "")
	      docket_search_page.form.add_field!("__EVENTTARGET", "ctl00$ContentPlaceHolder1$btnSearchSTD")
	      docket_search_results_page = agent.submit(docket_search_page.form)
	      docket_search_results_page.form.add_field!("__EVENTARGUMENT", "")
	      docket_search_results_page.form.add_field!("__EVENTTARGET", "ctl00$ContentPlaceHolder1$reResults$ctl01$lnkDockets")
	      @target_docket_page = agent.submit(docket_search_results_page.form)
	      if @target_docket_page.search("tr.RowPrimary", "tr.RowAlt").count == 0
		    @docket_count = "(0)"
	      else
		    @docket_count = "(" << @target_docket_page.search("tr.RowPrimary", "tr.RowAlt").count.to_s << ")"
	      end
	    rescue Errno::ETIMEDOUT, Timeout::Error, Net::HTTPNotFound
		  @docket_count = "(NF)"
	    rescue Exception => e
		  @docket_count = "(NF)"
	    end
	  end
    else
	  @docket_count = ""
    end
    
    require "fileutils" 
    matterdir = Filesystem.initdir << "Matters/" << @matter.id.to_s
    if File.directory?(matterdir)
	  @matterdir = matterdir
	  @file_count = "(" + (Dir.foreach(@matterdir).count - 2).to_s + ")"
	  @dirfiles = Dir.foreach(@matterdir)
    else
	  FileUtils.mkdir(matterdir)
	  @matterdir = matterdir
	  @file_count = "(0)"
	  @dirfiles = Dir.foreach(@matterdir)
    end
  
  end

  def new
    @client = @matter.clients.build
  end

  def create
    @client = Client.where(:id => params[:client_id]).first
    if @client.nil?
      @matter = Matter.new(matter_params)
      if @matter.save
        redirect_to @matter
        flash[:alert] = "Matter Successfully Created."
      else
	    redirect_to "new"
	    flash[:alert] = "Matter Not Created."
      end
    else
      @client.matters << (@matter = Matter.new(matter_params))
      if @matter.save
        redirect_to :back
        flash[:alert] = "Matter Successfully Created."
      else
	    redirect_to :back
	    flash[:alert] = "Matter Not Created (Blank Plaintiff or Defendant)"
      end
    end
  end

  def edit
    @matter = Matter.find(params[:id])
  end
  
  def update
    @matter = Matter.find(params[:id])
    if @matter.update(matter_params)
      redirect_to :back
    else
      render "edit"
    end
  end

  def destroy
    @matter = Matter.find(params[:id])
    @matter.destroy
    redirect_to matters_path
  end

  def index
    if params[:limit]
      @search = Matter.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @matters = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @matters.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = Matter.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 25
      end
      @matters = @search.results
      flash.discard
    end
  end

  def download
    @matter = Matter.find(params[:id])
    @fname = (params[:fname])
    if @fname.to_s[-4,4] == ".pdf"
      matterdir = Filesystem.initdir << "Matters/" << @matter.id.to_s << "/" << @fname.to_s
      send_file(matterdir, :disposition => "inline", :type=>"application/pdf", :x_sendfile => true)
    elsif @fname.to_s[-4,4] == ".jpg" || @fname.to_s[-4,4] == "jpeg" || @fname.to_s[-4,4] == ".gif" || @fname.to_s[-4,4] == ".png" || @fname.to_s[-4,4] == ".bmp"
      matterdir = Filesystem.initdir << "Matters/" << @matter.id.to_s << "/" << @fname.to_s
      send_file(matterdir, :disposition => "inline", :type=>"image", :x_sendfile => true)
    else
      matterdir = Filesystem.initdir << "Matters/" << @matter.id.to_s << "/" << @fname.to_s
      send_file(matterdir, :x_sendfile => true)
    end
  end

  def upload
    if params[:document].blank?
      flash[:alert] = "Must Select a Document to Upload"
      redirect_to :back
    else
	  @matter = Matter.find(params[:id])
      redirect_to :back
      matterdir = Filesystem.initdir << "Matters/" << @matter.id.to_s << "/"
      uploaded_io = params[:document]
      File.open(Rails.root.join(matterdir, uploaded_io.original_filename), "wb") do |file|
        file.write(uploaded_io.read)
      end
    end
  end

  def create_docx
    require "tempfile"
    @matter = Matter.find(params[:id])
    matterdir = Filesystem.initdir << "Matters/" << @matter.id.to_s
    template = URI.decode(params[:template])
    template_name = template.split("/")[-1].split(".docx").first
    @download = params[:download]
    @save = params[:save]
    unless template.blank?
      if Gem.win_platform?
	    doc = DocxReplace::Doc.new("#{template}", "C:/Users/Temp/AppData/Local/Temp")
      else
	    doc = DocxReplace::Doc.new("#{template}", "#{Rails.root}/tmp/docx")
      end
      doc.replace("$matterno$", @matter.case_no.to_s)
	  if Gem.win_platform?
	    tmp_file = Tempfile.new("DOCXTemplate", "C:/Users/Temp/AppData/Local/Temp")
	    begin
		  doc.commit(tmp_file)
	    ensure
		  tmp_file.unlink
		  tmp_file.close
	    end
      else
	    tmp_file = Tempfile.new("DOCXTemplate", "#{Rails.root}/tmp/docx")
	    doc.commit(tmp_file)
	  end
	  if @download == "true" && @save == "true"
	    FileUtils.mv tmp_file, "#{matterdir}/#{template_name} - #{@matter.id}.docx"
	    send_file("#{matterdir}/#{template_name} - #{@matter.id}.docx", :disposition => "inline", :x_sendfile => true)
      end
	  if @download != "true" && @save == "true"
        FileUtils.mv tmp_file, matterdir << "/#{template_name} - #{@matter.id}.docx"
	    redirect_to :back
	  end
	  if @download == "true" && @save != "true"
	    send_file(tmp_file.path, filename: "#{template_name} - #{@matter.id}.docx", :disposition => "inline", :x_sendfile => true)
	  end
	  if @download != "true" && @save != "true"
	  end
    end
  end

  private
  def matter_params
    params.require(:matter).permit(:id, :client_ids, :plaintiff, :defendant, :side, :case_state,
    :case_county, :case_year, :case_sequence, :case_code, :case_location,
    :judicial_section, :judge, :opposing_counsel, :filing_date, :date_of_sop,
    :initial_court_date, :closing_date, :status, :matter_closed,
    :created_at, :updated_at, notes_attributes: [:id, :user_id, :note, :noteable_id,
    :noteable_type, :created_at, :updated_at], tasks_attributes: [:id, :task,
    :taskable_id, :taskable_type, :priority, :due_date, :created_by, :assigned_to,
    :status, :created_at, :updated_at])
  end
end
