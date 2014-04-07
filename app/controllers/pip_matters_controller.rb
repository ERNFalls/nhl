class PipMattersController < ApplicationController
  
  layout "main"

  #Documented Bug with CanCan - Devise that consumed an hour of my life. The workaround is just to "except: [:create]" as below. 2/15/14 - EES
  load_and_authorize_resource except: [:create]

  def show
    @pip = PipMatter.find(params[:id])
    @able = @pip
    @templates = Template.where({:template_type => "PIP" || "General"})
    @demands = PipDemand.where({:pip_matter_id => @pip})
    @checks = PipCheck.where({:pip_matter_id => @pip})
    
    unless @pip.case_no.to_s.empty?
	  unless Gem.win_platform?
	    begin
	      agent = Mechanize.new
	      page = agent.get("https://www2.miami-dadeclerk.com/civil/search.aspx")
	      form = page.form("aspnetForm")
	      form.add_field!("__EVENTARGUMENT", "")
	      form.add_field!("__EVENTTARGET", "ctl00$ContentPlaceHolder1$TabMenu1$lnkpnlSearch2")
	      docket_search_page = agent.submit(form)
	      docket_search_page.form["ctl00$ContentPlaceHolder1$txtLCNYearSTD"] = @pip.case_year
	      docket_search_page.form["ctl00$ContentPlaceHolder1$txtLCNSeqSTD"] = @pip.case_sequence
	      docket_search_page.form["ctl00$ContentPlaceHolder1$txtLCNCodeSTD"] = @pip.case_code
	      docket_search_page.form["ctl00$ContentPlaceHolder1$txtLCNLocSTD"] = @pip.case_location
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
    pipdir = Filesystem.initdir << @pip.id.to_s
    if File.directory?(pipdir)
	  @pipdir = pipdir
	  @file_count = "(" + (Dir.foreach(@pipdir).count - 2).to_s + ")"
	  @dirfiles = Dir.foreach(@pipdir)
    else
	  FileUtils.mkdir(pipdir)
	  @pipdir = pipdir
	  @file_count = "(0)"
	  @dirfiles = Dir.foreach(@pipdir)
    end
  
  end

  def new
    @pip = PipMatter.new
  end
 
  def create
    @pip = PipMatter.new(pip_params)
    if @pip.save
      redirect_to @pip
	else
	  render "new"
	end
  end
 
  def edit
    @pip = PipMatter.find(params[:id])
  end
  
  def update
    @pip = PipMatter.find(params[:id])
    if @pip.update(pip_params)
      redirect_to @pip
    else
      render "edit"
    end
  end

  def destroy
    @pip = PipMatter.find(params[:id])
    @pip.destroy
    redirect_to pip_matters_path
  end

  def index
    if params[:limit]
      @search = PipMatter.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @pips = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @pips.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = PipMatter.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 25
      end
      @pips = @search.results
      flash.discard
    end
  end

  def download
    @pip = PipMatter.find(params[:id])
    @fname = (params[:fname])
    if @fname.to_s[-4,4] == ".pdf"
      pipdir = Filesystem.initdir << @pip.id.to_s << "/" << @fname.to_s
      send_file(pipdir, :disposition => "inline", :type=>"application/pdf", :x_sendfile => true)
    elsif @fname.to_s[-4,4] == ".jpg" || @fname.to_s[-4,4] == "jpeg" || @fname.to_s[-4,4] == ".gif" || @fname.to_s[-4,4] == ".png" || @fname.to_s[-4,4] == ".bmp"
      pipdir = Filesystem.initdir << @pip.id.to_s << "/" << @fname.to_s
      send_file(pipdir, :disposition => "inline", :type=>"image", :x_sendfile => true)
    else
      pipdir = Filesystem.initdir << @pip.id.to_s << "/" << @fname.to_s
      send_file(pipdir, :x_sendfile => true)
    end
  end

  def upload
    if params[:document].blank?
      flash[:alert] = "Must Select a Document to Upload"
      redirect_to :back
    else
	  @pip = PipMatter.find(params[:id])
      redirect_to :back
      pipdir = Filesystem.initdir << @pip.id.to_s << "/"
      uploaded_io = params[:document]
      File.open(Rails.root.join(pipdir, uploaded_io.original_filename), "wb") do |file|
        file.write(uploaded_io.read)
      end
    end
  end

  def create_docx
    require "tempfile"
    @pip = PipMatter.find(params[:id])
    pipdir = Filesystem.initdir << @pip.id.to_s
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
      doc.replace("claimant_first_name", @pip.claimant_first_name.to_s)
      doc.replace("claimant_middle_name", @pip.claimant_middle_name.to_s)
      doc.replace("claimant_last_name", @pip.claimant_last_name.to_s)
      doc.replace("date_of_loss", @pip.date_of_loss.to_s)
      doc.replace("medical_provider", @pip.medical_provider.to_s)
      doc.replace("claim_no", @pip.claim_no.to_s)
      doc.replace("policy_no", @pip.policy_no.to_s)
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
	    FileUtils.mv tmp_file, "#{pipdir}/#{template_name} - #{@pip.id}.docx"
	    send_file("#{pipdir}/#{template_name} - #{@pip.id}.docx", :disposition => "inline", :x_sendfile => true)
      end
	  if @download != "true" && @save == "true"
        FileUtils.mv tmp_file, pipdir << "/#{template_name} - #{@pip.id}.docx"
	    redirect_to :back
	  end
	  if @download == "true" && @save != "true"
	    send_file(tmp_file.path, filename: "#{template_name} - #{@pip.id}.docx", :disposition => "inline", :x_sendfile => true)
	  end
	  if @download != "true" && @save != "true"
	  end
    end
  end

  private
  def pip_params
    params.require(:pip_matter).permit(:id, :medical_provider,
    :claimant_last_name, :claimant_first_name, :claimant_middle_name, :claimant_prefix, :claimant_suffix,
    :date_of_loss, :insurance_carrier, :insurance_company, :claim_no, :policy_no, :insured_name,
    :first_date_of_policy, :final_date_of_policy, :claims_adjuster, :plaintiff, :defendant, :side,
    :case_state, :case_county, :case_year, :case_sequence, :case_code, :case_location,
    :judicial_section, :judge, :opposing_counsel, :date_suit_filed, :date_of_sop,
    :initial_court_date, :status, :closing_date, :created_at, :updated_at,
    notes_attributes: [:id, :user_id, :note, :noteable_id, :noteable_type,
    :created_at, :updated_at], tasks_attributes: [:id, :task, :taskable_id,
    :taskable_type, :priority, :due_date, :created_by, :assigned_to, :status,
    :created_at, :updated_at])
  end
end
