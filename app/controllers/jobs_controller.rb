class JobsController < ApplicationController

  layout "main"

  load_and_authorize_resource
  
  def create
    @client = Client.find(params[:client_id])
    @job = @client.jobs.create(job_params)
	if @job.save
	  redirect_to @client
    else
	  render "new"
	end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to client_path(@job.client_id)
	else
      render "edit"
    end
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @job = @client.jobs.find(params[:id])
    @job.destroy
    redirect_to client_path(@client)
  end

  private
    def job_params
      params.require(:job).permit(:id, :employer, :address_line_one, :address_line_two, 
      :address_line_three, :city, :state, :zip_code, :plus_four_code, 
      :position, :employment_length, :payment_cycle, :gross_earnings, 
      :net_earnings, :client_id, :created_at, :updated_at)
    end
end
