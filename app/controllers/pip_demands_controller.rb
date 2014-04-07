class PipDemandsController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @matter = PipMatter.find(params[:pip_matter_id])
    @demand = @matter.pip_demands.create(pip_demand_params)
	if @demand.save
	  redirect_to @matter
    else
	  render "new"
	end
  end

  def update
    @demand = PipDemand.find(params[:id])
    if @demand.update(pip_demand_params)
      redirect_to pip_matter_path(@demand.pip_matter_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @matter = PipMatter.find(params[:pip_matter_id])
    @demand = @matter.pip_demands.find(params[:id])
    @demand.destroy
    redirect_to pip_matter_path(@matter)
  end

  private
    def pip_demand_params
      params.require(:pip_demand).permit(:id, :first_date_of_service,
      :final_date_of_service, :demand_sent, :date_demand_sent,
      :carrier_received, :date_carrier_received, :carrier_responded, :date_of_response,
      :certified_mail_no, :postage_cost, :total_billed, :amount_paid_predemand,
      :deductible, :carrier_response, :include_demand_in_suit, :pip_matter_id,
      :created_at, :updated_at)
    end
end
