class AddressesController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def find_addressable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to :back
  end
  
  def index
    @addressable = find_addressable
    @addresses = @addressable.addresses
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to :back
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to :back
  end

  private
  def address_params
    params.require(:address).permit(:id, :address_line_one, :address_line_two,
    :address_line_three, :city, :state, :zip_code, :plus_four_code, :country,
    :address_type, :addressable_id, :addressable_type, :created_at, :updated_at)
  end

end
