class BankAccountsController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @bankacc = @client.bank_accounts.create(bank_account_params)
	if @bankacc.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @bankacc = BankAccount.find(params[:id])
    if @bankacc.update(bank_account_params)
      redirect_to client_path(@bankacc.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @bankacc = @client.bank_accounts.find(params[:id])
    @bankacc.destroy
    redirect_to client_path(@client)
  end

  private
    def bank_account_params
      params.require(:bank_account).permit(:id, :bank, :account_type,
      :average_monthly_balance, :client_id, :created_at, :updated_at)
    end
end
