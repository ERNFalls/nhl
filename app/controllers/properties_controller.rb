class PropertiesController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @prop = @client.properties.create(property_params)
	if @prop.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @prop = Property.find(params[:id])
    if @prop.update(property_params)
      redirect_to client_path(@prop.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @prop = @client.properties.find(params[:id])
    @prop.destroy
    redirect_to client_path(@client)
  end

  private
    def property_params
      params.require(:property).permit(:id, :rent, :property_type, :date_of_purchase,
      :address_line_one, :address_line_two, :address_line_three, :city, :state,
      :zip_code, :plus_four_code, :country, :association_name, :association_address_line_one,
      :association_address_line_two, :association_address_line_three, :association_city,
      :association_state, :association_zip_code, :association_plus_four_code,
      :association_balance, :client_id, :created_at, :updated_at)
    end
end
