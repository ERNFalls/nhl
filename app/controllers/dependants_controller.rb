class DependantsController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @dependant = @client.dependants.create(dependant_params)
	if @dependant.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @dependant = Dependant.find(params[:id])
    if @dependant.update(dependant_params)
      redirect_to client_path(@dependant.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @dependant = @client.dependants.find(params[:id])
    @dependant.destroy
    redirect_to client_path(@client)
  end

  private
    def dependant_params
      params.require(:dependant).permit(:id, :last_name, :first_name, :middle_name,
      :prefix, :suffix, :ssn, :date_of_birth, :relationship, :employment,
      :client_id, :created_at, :updated_at)
    end
end
