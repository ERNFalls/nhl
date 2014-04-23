class FurnituresController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @furniture = @client.furnitures.create(furniture_params)
	if @furniture.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @furniture = Furniture.find(params[:id])
    if @furniture.update(furniture_params)
      redirect_to client_path(@furniture.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @furniture = @client.furnitures.find(params[:id])
    @furniture.destroy
    redirect_to client_path(@client)
  end

  private
    def furniture_params
      params.require(:furniture).permit(:id, :item_model, :description,
      :price_at_purchase, :date_of_purchase, :number_owned, :client_id,
      :created_at, :updated_at)
    end
end
