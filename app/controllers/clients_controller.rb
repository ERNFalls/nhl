class ClientsController < ApplicationController

  layout "main"

  load_and_authorize_resource

  require "csv"

  def show
	@client = Client.find(params[:id])
	@able = @client
    @templates = Template.where({:template_type => "Client" || "General"})
    @properties = Property.where({:client_id => @client})

    require "fileutils"
    if @client.legacy_pd_file
      clientdir = Filesystem.initdir << "Clients/" << @client.legacy_pd_file.to_s
    else
      clientdir = Filesystem.initdir << "Clients/" << @client.client_filename
    end
    if File.directory?(clientdir)
	  @clientdir = clientdir
	  @file_count = "(" + (Dir.foreach(@clientdir).count - 2).to_s + ")"
	  @dirfiles = Dir.foreach(@clientdir)
    else
	  FileUtils.mkdir(clientdir)
	  @clientdir = clientdir
	  @file_count = "(0)"
	  @dirfiles = Dir.foreach(@clientdir)
    end
  end
  
  def new
    @client = Client.new
    @client.phone_numbers.build
    @client.email_addresses.build
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
	  render "new"
    end
  end

  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
      sign_in(@client, :bypass => true) if @client == current_user
    else
      render "edit"
    end
  end
  
  def index
    if params[:limit]
      @search = Client.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @clients = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @clients.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = Client.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 10
      end
      @clients = @search.results
      flash.discard
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  def importpd
    Client.delete_all
    Client.importpd(params[:file])
    redirect_to home_home_path, notice: "ProDocs Clients Successfully Imported."
  end

  def download
    if @client.legacy_pd_file
      clientdir = Filesystem.initdir << "Clients/" << @client.legacy_pd_file.to_s
    else
      clientdir = Filesystem.initdir << "Clients/" << @client.client_filename
    end
    @client = Client.find(params[:id])
    @fname = (params[:fname])
    if @fname.to_s[-4,4] == ".pdf"
      path_to_file = clientdir << "/" << @fname.to_s
      send_file(path_to_file, :disposition => "inline", :type=>"application/pdf", :x_sendfile => true)
    elsif @fname.to_s[-4,4] == ".jpg" || @fname.to_s[-4,4] == "jpeg" || @fname.to_s[-4,4] == ".gif" || @fname.to_s[-4,4] == ".png" || @fname.to_s[-4,4] == ".bmp"
      path_to_file = clientdir << "/" << @fname.to_s
      send_file(path_to_file, :disposition => "inline", :type=>"image", :x_sendfile => true)
    else
      path_to_file = clientdir << "/" << @fname.to_s
      send_file(path_to_file, :x_sendfile => true)
    end
  end

  def upload
    if @client.legacy_pd_file
      clientdir = Filesystem.initdir << "Clients/" << @client.legacy_pd_file.to_s
    else
      clientdir = Filesystem.initdir << "Clients/" << @client.client_filename
    end
    if params[:document].blank?
      flash[:alert] = "Must Select a Document to Upload"
      redirect_to :back
    else
	  @client = Client.find(params[:id])
      redirect_to :back
      path_to_file = clientdir << "/"
      uploaded_io = params[:document]
      File.open(Rails.root.join(path_to_file, uploaded_io.original_filename), "wb") do |file|
        file.write(uploaded_io.read)
      end
    end
  end

  def create_docx
    require "tempfile"
    @client = Client.find(params[:id])
    if @client.legacy_pd_file
      clientdir = Filesystem.initdir << "Clients/" << @client.legacy_pd_file.to_s
    else
      clientdir = Filesystem.initdir << "Clients/" << @client.client_filename
    end
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
      #Object for Number to Currency conversion:  
      currencier = Object.new.extend(ActionView::Helpers::NumberHelper)
      #Client string replacement:
      doc.replace("clientlastname", @client.last_name.to_s, true)
      doc.replace("clientfirstname", @client.first_name.to_s, true)
      doc.replace("clientmiddlename", @client.middle_name.to_s, true)
      doc.replace("clientprefix", @client.prefix.to_s, true)
      doc.replace("clientsuffix", @client.suffix.to_s, true)
      doc.replace("clientcompanyname", @client.company_name.to_s, true)
      doc.replace("clientssn", @client.ssn.to_s, true)
      doc.replace("clientdlno", @client.drivers_license_no.to_s, true)
      doc.replace("clientaddressone", @client.address_line_one.to_s, true)
      doc.replace("clientaddresstwo", @client.address_line_two.to_s, true)
      doc.replace("clientaddressthree", @client.address_line_three.to_s, true)
      doc.replace("clientcity", @client.city.to_s, true)
      doc.replace("clientstate", @client.state.to_s, true)
      doc.replace("clientzip", @client.zip_code.to_s, true)
      doc.replace("clientplusfour", @client.plus_four_code.to_s, true)
      doc.replace("clientcountry", @client.country.to_s, true)
      doc.replace("clientaliases", @client.aliases.to_s, true)
      doc.replace("clientspouse", @client.spouse.to_s, true)
      doc.replace("clientmaritalstatus", @client.marital_status.to_s, true)
      doc.replace("clientrepo", @client.repossessions.to_s, true)
      doc.replace("clientpendingsuits", @client.pending_suit.to_s, true)
      if @client.amount_owed_to_irs
        doc.replace("clientowesirs", currencier.number_to_currency(@client.amount_owed_to_irs), true)
      end
      doc.replace("clientsdcontents", @client.safety_deposit_contents.to_s, true)
      doc.replace("clientsdlocation", @client.safety_deposit_location.to_s, true)
      doc.replace("clientsdlist", @client.safety_deposit_list.to_s, true)
      doc.replace("clientotherlosses", @client.other_losses.to_s, true)
      if @client.retirement
        doc.replace("clientretirement", currencier.number_to_currency(@client.retirement), true)
      end
      if @client.pension
        doc.replace("clientpension", currencier.number_to_currency(@client.pension), true)
      end
      if @client.disability
        doc.replace("clientdisability", currencier.number_to_currency(@client.disability), true)
      end
      if @client.child_support
        doc.replace("clientchildsupport", currencier.number_to_currency(@client.child_support), true)
      end
      if @client.alimony
        doc.replace("clientalimony", currencier.number_to_currency(@client.alimony), true)
      end
      if @client.other_income
        doc.replace("clientotherincome", currencier.number_to_currency(@client.other_income), true)
      end
      doc.replace("clientreferredby", @client.referred_by.to_s, true)
      doc.replace("clientemail", @client.email.to_s, true)
      if @client.ira == true
        doc.replace("clientira", "Yes", true)
      else
        doc.replace("clientira", "No", true)
      end
      if @client.four_o_one_k == true
        doc.replace("client401k", "Yes", true)
      else
        doc.replace("client401k", "No", true)
      end
      if @client.properties.first.rent == true
        doc.replace("prop1rent", "Yes")
      else
        doc.replace("prop1rent", "No")
      end
      # Properties string replacement for the first five properties:
      # Property One
      unless @client.properties.first.nil?
        doc.replace("prop1propertytype", @client.properties.first.property_type.to_s, true)
        doc.replace("prop1dateofpurchase", @client.properties.first.date_of_purchase.to_s, true)
        doc.replace("prop1addresslineone", @client.properties.first.address_line_one.to_s, true)
        doc.replace("prop1addresslinetwo", @client.properties.first.address_line_two.to_s, true)
        doc.replace("prop1addresslinethree", @client.properties.first.address_line_three.to_s, true)
        doc.replace("prop1city", @client.properties.first.city.to_s, true)
        doc.replace("prop1state", @client.properties.first.state.to_s, true)
        doc.replace("prop1zipcode", @client.properties.first.zip_code.to_s, true)
        doc.replace("prop1plusfourcode", @client.properties.first.plus_four_code.to_s, true)
        doc.replace("prop1country", @client.properties.first.country.to_s, true)
        doc.replace("prop1associationname", @client.properties.first.association_name.to_s, true)
        doc.replace("prop1associationaddresslineone", @client.properties.first.association_address_line_one.to_s, true)
        doc.replace("prop1associationaddresslinetwo", @client.properties.first.association_address_line_two.to_s, true)
        doc.replace("prop1associationaddresslinethree", @client.properties.first.association_address_line_three.to_s, true)
        doc.replace("prop1associationcity", @client.properties.first.association_city.to_s, true)
        doc.replace("prop1associationstate", @client.properties.first.association_state.to_s, true)
        doc.replace("prop1associationzipcode", @client.properties.first.association_zip_code.to_s, true)
        doc.replace("prop1associationplusfourcode", @client.properties.first.association_plus_four_code.to_s, true)
        if @client.properties.first.association_balance
          doc.replace("prop1associationbalance", currencier.number_to_currency(@client.properties.first.association_balance), true)
        end
        # Property Two
        unless @client.properties.second.nil?
          doc.replace("prop2propertytype", @client.properties.second.property_type.to_s, true)
          doc.replace("prop2dateofpurchase", @client.properties.second.date_of_purchase.to_s, true)
          doc.replace("prop2addresslineone", @client.properties.second.address_line_one.to_s, true)
          doc.replace("prop2addresslinetwo", @client.properties.second.address_line_two.to_s, true)
          doc.replace("prop2addresslinethree", @client.properties.second.address_line_three.to_s, true)
          doc.replace("prop2city", @client.properties.second.city.to_s, true)
          doc.replace("prop2state", @client.properties.second.state.to_s, true)
          doc.replace("prop2zipcode", @client.properties.second.zip_code.to_s, true)
          doc.replace("prop2plusfourcode", @client.properties.second.plus_four_code.to_s, true)
          doc.replace("prop2country", @client.properties.second.country.to_s, true)
          doc.replace("prop2associationname", @client.properties.second.association_name.to_s, true)
          doc.replace("prop2associationaddresslineone", @client.properties.second.association_address_line_one.to_s, true)
          doc.replace("prop2associationaddresslinetwo", @client.properties.second.association_address_line_two.to_s, true)
          doc.replace("prop2associationaddresslinethree", @client.properties.second.association_address_line_three.to_s, true)
          doc.replace("prop2associationcity", @client.properties.second.association_city.to_s, true)
          doc.replace("prop2associationstate", @client.properties.second.association_state.to_s, true)
          doc.replace("prop2associationzipcode", @client.properties.second.association_zip_code.to_s, true)
          doc.replace("prop2associationplusfourcode", @client.properties.second.association_plus_four_code.to_s, true)
          if @client.properties.second.association_balance
            doc.replace("prop2associationbalance", currencier.number_to_currency(@client.properties.second.association_balance), true)
          end
          # Property Three
          unless @client.properties.third.nil?
            doc.replace("prop3propertytype", @client.properties.third.property_type.to_s, true)
            doc.replace("prop3dateofpurchase", @client.properties.third.date_of_purchase.to_s, true)
            doc.replace("prop3addresslineone", @client.properties.third.address_line_one.to_s, true)
            doc.replace("prop3addresslinetwo", @client.properties.third.address_line_two.to_s, true)
            doc.replace("prop3addresslinethree", @client.properties.third.address_line_three.to_s, true)
            doc.replace("prop3city", @client.properties.third.city.to_s, true)
            doc.replace("prop3state", @client.properties.third.state.to_s, true)
            doc.replace("prop3zipcode", @client.properties.third.zip_code.to_s, true)
            doc.replace("prop3plusfourcode", @client.properties.third.plus_four_code.to_s, true)
            doc.replace("prop3country", @client.properties.third.country.to_s, true)
            doc.replace("prop3associationname", @client.properties.third.association_name.to_s, true)
            doc.replace("prop3associationaddresslineone", @client.properties.third.association_address_line_one.to_s, true)
            doc.replace("prop3associationaddresslinetwo", @client.properties.third.association_address_line_two.to_s, true)
            doc.replace("prop3associationaddresslinethree", @client.properties.third.association_address_line_three.to_s, true)
            doc.replace("prop3associationcity", @client.properties.third.association_city.to_s, true)
            doc.replace("prop3associationstate", @client.properties.third.association_state.to_s, true)
            doc.replace("prop3associationzipcode", @client.properties.third.association_zip_code.to_s, true)
            doc.replace("prop3associationplusfourcode", @client.properties.third.association_plus_four_code.to_s, true)
            if @client.properties.third.association_balance
              doc.replace("prop3associationbalance", currencier.number_to_currency(@client.properties.third.association_balance), true)
            end
            # Property Four
            unless @client.properties.fourth.nil?
              doc.replace("prop4propertytype", @client.properties.fourth.property_type.to_s, true)
              doc.replace("prop4dateofpurchase", @client.properties.fourth.date_of_purchase.to_s, true)
              doc.replace("prop4addresslineone", @client.properties.fourth.address_line_one.to_s, true)
              doc.replace("prop4addresslinetwo", @client.properties.fourth.address_line_two.to_s, true)
              doc.replace("prop4addresslinethree", @client.properties.fourth.address_line_three.to_s, true)
              doc.replace("prop4city", @client.properties.fourth.city.to_s, true)
              doc.replace("prop4state", @client.properties.fourth.state.to_s, true)
              doc.replace("prop4zipcode", @client.properties.fourth.zip_code.to_s, true)
              doc.replace("prop4plusfourcode", @client.properties.fourth.plus_four_code.to_s, true)
              doc.replace("prop4country", @client.properties.fourth.country.to_s, true)
              doc.replace("prop4associationname", @client.properties.fourth.association_name.to_s, true)
              doc.replace("prop4associationaddresslineone", @client.properties.fourth.association_address_line_one.to_s, true)
              doc.replace("prop4associationaddresslinetwo", @client.properties.fourth.association_address_line_two.to_s, true)
              doc.replace("prop4associationaddresslinethree", @client.properties.fourth.association_address_line_three.to_s, true)
              doc.replace("prop4associationcity", @client.properties.fourth.association_city.to_s, true)
              doc.replace("prop4associationstate", @client.properties.fourth.association_state.to_s, true)
              doc.replace("prop4associationzipcode", @client.properties.fourth.association_zip_code.to_s, true)
              doc.replace("prop4associationplusfourcode", @client.properties.fourth.association_plus_four_code.to_s, true)
              if @client.properties.fourth.association_balance
                doc.replace("prop4associationbalance", currencier.number_to_currency(@client.properties.fourth.association_balance), true)
              end
              # Property Five
              unless @client.properties.fifth.nil?
                doc.replace("prop5propertytype", @client.properties.fifth.property_type.to_s, true)
                doc.replace("prop5dateofpurchase", @client.properties.fifth.date_of_purchase.to_s, true)
                doc.replace("prop5addresslineone", @client.properties.fifth.address_line_one.to_s, true)
                doc.replace("prop5addresslinetwo", @client.properties.fifth.address_line_two.to_s, true)
                doc.replace("prop5addresslinethree", @client.properties.fifth.address_line_three.to_s, true)
                doc.replace("prop5city", @client.properties.fifth.city.to_s, true)
                doc.replace("prop5state", @client.properties.fifth.state.to_s, true)
                doc.replace("prop5zipcode", @client.properties.fifth.zip_code.to_s, true)
                doc.replace("prop5plusfourcode", @client.properties.fifth.plus_four_code.to_s, true)
                doc.replace("prop5country", @client.properties.fifth.country.to_s, true)
                doc.replace("prop5associationname", @client.properties.fifth.association_name.to_s, true)
                doc.replace("prop5associationaddresslineone", @client.properties.fifth.association_address_line_one.to_s, true)
                doc.replace("prop5associationaddresslinetwo", @client.properties.fifth.association_address_line_two.to_s, true)
                doc.replace("prop5associationaddresslinethree", @client.properties.fifth.association_address_line_three.to_s, true)
                doc.replace("prop5associationcity", @client.properties.fifth.association_city.to_s, true)
                doc.replace("prop5associationstate", @client.properties.fifth.association_state.to_s, true)
                doc.replace("prop5associationzipcode", @client.properties.fifth.association_zip_code.to_s, true)
                doc.replace("prop5associationplusfourcode", @client.properties.fifth.association_plus_four_code.to_s, true)
                if @client.properties.fifth.association_balance
                  doc.replace("prop5associationbalance", currencier.number_to_currency(@client.properties.fifth.association_balance), true)
                end
              end
            end
          end
        end
      end
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
	    FileUtils.mv tmp_file, "#{clientdir}/#{Date.today.to_s} - #{template_name} - #{@client.id}.docx"
	    send_file("#{clientdir}/#{Date.today.to_s} - #{template_name} - #{@client.id}.docx", :disposition => "inline", :x_sendfile => true)
      end
	  if @download != "true" && @save == "true"
        FileUtils.mv tmp_file, clientdir << "/#{Date.today.to_s} - #{template_name} - #{@client.id}.docx"
	    redirect_to :back
	  end
	  if @download == "true" && @save != "true"
	    send_file(tmp_file.path, filename: "#{Date.today.to_s} - #{template_name} - #{@client.id}.docx", :disposition => "inline", :x_sendfile => true)
	  end
	  if @download != "true" && @save != "true"
	  end
    end
  end

private
  def client_params
    params.require(:client).permit(:id, :matter_ids, :last_name, :first_name, :middle_name,
    :prefix, :suffix, :company_name, :email, :ssn, :drivers_license_no, :date_of_birth,
    :address_line_one, :address_line_two, :address_line_three, :city, :state, :zip_code, 
    :plus_four_code, :country, :aliases, :marital_status, :spouse, :repossessions, :amount_owed_to_irs,
    :safety_deposit_contents, :safety_deposit_location, :safety_deposit_list, :pending_suits,
    :other_losses, :ira, :four_o_one_k, :retirement, :pension, :disability, :child_support,
    :alimony, :other_income, :referred_by, :encrypted_password, :password,
    :password_confirmation, :reset_password_token, :reset_password_sent_at, :remember_created_at,
	:sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
	:last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :unconfirmed_email,
	:created_at, :updated_at, :legacy_pd_email_two, :legacy_pd_suffix, :legacy_pd_one,
    :legacy_pd_two, :legacy_pd_three, :legacy_pd_four, :legacy_pd_file,
    phone_numbers_attributes: [:id, :phone_number_type, :country_code,
    :area_code, :exchange, :suffix, :extension, :phoneable_type, :phoneable_id,
    :created_at, :updated_at], email_addresses_attributes: [:id,
    :address, :address_type, :description, :emailable_type, :emailable_id,
    :created_at, :updated_at], notes_attributes: [:id, :user_id, :note, 
    :noteable_id, :noteable_type, :created_at, :updated_at], tasks_attributes:
    [:id, :task, :taskable_id, :taskable_type, :priority, :due_date, :created_by,
    :assigned_to, :status, :created_at, :updated_at])
  end
end
