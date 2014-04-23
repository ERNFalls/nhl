class VehiclesController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @vehicle = @client.vehicles.create(vehicle_params)
	if @vehicle.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      redirect_to client_path(@vehicle.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @vehicle = @client.vehicles.find(params[:id])
    @vehicle.destroy
    redirect_to client_path(@client	)
  end

  private
    def vehicle_params
      params.require(:vehicle).permit(:id, :keep, :ownership_type, :year,
      :make, :model, :color, :vin_no, :current_mileage, :bank, :account_no,
      :balance_owed, :client_id, :created_at, :updated_at)
    end
end
