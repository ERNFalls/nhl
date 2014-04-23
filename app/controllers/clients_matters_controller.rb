class ClientsMattersController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def create
    @climat = ClientsMatter.new(clients_matter_params)
	if @climat.save
	  redirect_to :back
    else
	  render "new"
	end
  end

  def destroy
    @climat = ClientsMatter.find(params[:id])
    @climat.destroy
    redirect_to :back
  end

  private
    def clients_matter_params
      params.require(:clients_matter).permit(:id, :client_id, :matter_id,
      :created_at, :updated_at)
    end
end
