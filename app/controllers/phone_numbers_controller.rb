class PhoneNumbersController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def find_phoneable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
  def create
    @phone_number = PhoneNumber.new(phone_number_params)
    @phone_number.save
    redirect_to :back
  end
  
  def index
    @phoneable = find_phoneable
    @phone_numbers = @phoneable.phone_numbers
  end

  def update
    @phone_number = PhoneNumber.find(params[:id])
    @phone_number.update(phone_number_params)
    redirect_to :back
  end

  def destroy
    @phone_number = PhoneNumber.find(params[:id])
    @phone_number.destroy
    redirect_to :back
  end

  private
  def phone_number_params
    params.require(:phone_number).permit(:id, :country_code, :area_code,
    :exchange, :suffix, :extension, :phone_number_type, :phoneable_id,
    :phoneable_type, :created_at, :updated_at)
  end

end
