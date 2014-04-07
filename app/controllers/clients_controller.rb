class ClientsController < ApplicationController

  layout "main"

  load_and_authorize_resource

  require "csv"

  def show
	@client = Client.find(params[:id])
	@ablec = @client
  end
  
  def new
    @client = Client.new
    @client.phone_numbers.build
    @client.email_addresses.build
    @client.addresses.build
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
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
    redirect_to home_home_path, notice: "ProDocs Contacts Successfully Imported."
  end

private
  def client_params
    params.require(:client).permit(:id, :last_name, :first_name, :middle_name,
    :prefix, :suffix, :company_name, :email, :ssn, :drivers_license_no,
    :date_of_birth, :aliases, :marital_status, :repossessions, :amount_owed_to_irs,
    :safety_deposit_contents, :safety_deposit_location, :safety_deposit_list, :pending_suits,
    :other_losses, :ira, :four_o_one_k, :retirement, :pension, :disability, :child_support,
    :alimony, :other_income, :referred_by, :encrypted_password, :password,
    :password_confirmation, :reset_password_token, :reset_password_sent_at, :remember_created_at,
	:sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
	:last_sign_in_ip, :confirmation_token, :confirmation_sent_at, :unconfirmed_email,
	:created_at, :updated_at, phone_numbers_attributes: [:id, :number_type, :country_code,
    :area_code, :exchange, :suffix, :extension, :phoneable_type, :phoneable_id,
    :created_at, :updated_at], email_addresses_attributes: [:id,
    :address, :address_type, :description, :emailable_type, :emailable_id,
    :created_at, :updated_at], addresses_attributes: [:id, :address_line_one,
    :address_line_two, :address_line_three, :city, :state, :zip_code, :plus_four_code,
    :country, :address_type, :addressable_type, :addressable_id, :created_at, :updated_at])
  end
end
