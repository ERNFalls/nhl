class BoatsController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @boat = @client.boats.create(boat_params)
	if @boat.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      redirect_to client_path(@boat.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @boat = @client.boats.find(params[:id])
    @boat.destroy
    redirect_to client_path(@client)
  end

  private
    def boat_params
      params.require(:boat).permit(:id, :keep, :ownership_type, :year,
      :make, :model, :engine, :bank, :account_no, :balance_owed, :client_id,
      :created_at, :updated_at)
    end
end
