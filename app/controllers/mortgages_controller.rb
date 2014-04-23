class MortgagesController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @mortgage = @client.mortgages.create(mortgage_params)
	if @mortgage.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @mortgage = Mortgage.find(params[:id])
    if @mortgage.update(mortgage_params)
      redirect_to client_path(@mortgage.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @mortgage = @client.mortgages.find(params[:id])
    @mortgage.destroy
    redirect_to client_path(@client)
  end

  private
    def mortgage_params
      params.require(:mortgage).permit(:id, :mortgage_holder, :account_no,
      :address_line_one, :address_line_two, :address_line_three, :city,
      :state, :zip_code, :plus_four_code, :balance, :overdue_payment, :property_id,
      :client_id, :created_at, :updated_at)
    end
end
