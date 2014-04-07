class EmailAddressesController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def find_emailable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
  def create
    @email_address = EmailAddress.new(email_address_params)
    @email_address.save
    redirect_to :back
  end
  
  def index
    @emailable = find_emailable
    @email_addresses = @emailable.email_addresses
  end

  def update
    @email_address = EmailAddress.find(params[:id])
    @email_address.update(email_address_params)
    redirect_to :back
  end

  def destroy
    @email_address = EmailAddress.find(params[:id])
    @email_address.destroy
    redirect_to :back
  end

  private
  def email_address_params
    params.require(:email_address).permit(:id, :address, :address_type,
    :emailable_id, :emailable_type, :created_at, :updated_at)
  end

end
