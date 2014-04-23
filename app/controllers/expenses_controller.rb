class ExpensesController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @expense = @client.expenses.create(expense_params)
	if @expense.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      redirect_to client_path(@expense.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @expense = @client.expenses.find(params[:id])
    @expense.destroy
    redirect_to client_path(@client)
  end

  private
    def expense_params
      params.require(:expense).permit(:id, :expense_type, :expense, :client_id,
      :created_at, :updated_at)
    end
end
