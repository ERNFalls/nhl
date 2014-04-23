class ContactsController < ApplicationController

  layout "main"

  load_and_authorize_resource

  require "csv"
  
  def show
    @contact = Contact.find(params[:id])
    @able = @contact
  end
  
  def new
    @contact = Contact.new
    @contact.phone_numbers.build
    @contact.email_addresses.build
    @contact.addresses.build
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      respond_to do |format|
        flash.now[:notice] = "Succesfully Added Contact."
        format.html {redirect_to contacts_path}
        format.js
      end
      flash.discard
	else
      flash[:notice] = "Failed to Add Contact."
      respond_to do |format|
        format.html {redirect_to new_contact_path}
        format.js {render :action => "failed"}
      end
      flash.discard
	end
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render "edit"
    end
  end
  
  def index
    if params[:limit]
      @search = Contact.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @contacts = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @contacts.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = Contact.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 10
      end
      @contacts = @search.results
      flash.discard
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  def importpd
	Contact.delete_all
    Contact.importpd(params[:file])
    redirect_to home_home_path, notice: "ProDocs Contacts Successfully Imported."
  end

  private
  def contact_params
    params.require(:contact).permit(:id, :last_name, :first_name, :middle_name,
    :prefix, :suffix, :company_name, :contact_type,
    phone_numbers_attributes: [:id, :number_type, :country_code,
    :area_code, :exchange, :suffix, :extension, :phoneable_type, :phoneable_id,
    :created_at, :updated_at], email_addresses_attributes: [:id,
    :address, :address_type, :description, :emailable_type, :emailable_id,
    :created_at, :updated_at],
    addresses_attributes: [:id, :address_line_one, :address_line_two, :address_line_three, :city,
    :state, :zip_code, :plus_four_code, :country, :address_type, :addressable_type,
    :addressable_id, :created_at, :updated_at])
  end
end
