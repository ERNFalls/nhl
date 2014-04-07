class PipChecksController < ApplicationController

  layout "main"
  
  load_and_authorize_resource

  def create
    @matter = PipMatter.find(params[:pip_matter_id])
    @check = @matter.pip_checks.create(pip_check_params)
    if @check.save
	  redirect_to @matter
    else
	  render "new"
	end
  end

  def update
    @check = PipCheck.find(params[:id])
	if @check.update(pip_check_params)
      redirect_to pip_matter_path(@check.pip_matter_id)
    else
      render "edit"
    end
  end
  
  def destroy
    @matter = PipMatter.find(params[:pip_matter_id])
    @check = @matter.pip_checks.find(params[:id])
    @check.destroy
    redirect_to pip_matter_path(@matter)
  end

private
  def pip_check_params
    params.require(:pip_check).permit(:id, :check_no, :date_of_issue,
    :total_amount, :benefits, :interest, :penalty, :postage, :attorneys_fees,
    :purpose_of_check, :include_check_in_suit, :status, :pip_matter_id,
    :created_at, :updated_at)
  end  
end
