class CreditorsController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @creditor = @client.creditors.create(creditor_params)
	if @creditor.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @creditor = Creditor.find(params[:id])
    if @creditor.update(creditor_params)
      redirect_to client_path(@creditor.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @creditor = @client.creditors.find(params[:id])
    @creditor.destroy
    redirect_to client_path(@client)
  end

  private
    def creditor_params
      params.require(:creditor).permit(:id, :creditor, :account_no, :date_last_used, 
      :balance, :address_line_one, :address_line_two, :address_line_three, 
      :city, :state, :zip_code, :plus_four_code, :client_id, :created_at, :updated_at)
    end
end
