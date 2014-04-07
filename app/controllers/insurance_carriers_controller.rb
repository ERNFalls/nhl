class InsuranceCarriersController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def show
	@carrier = InsuranceCarrier.find(params[:id])
	@insurance_company = @carrier.insurance_companies.build
  end
  
  def new
    @carrier = InsuranceCarrier.new
  end
  
  def create
    @carrier = InsuranceCarrier.new(insurance_carrier_params)
    if @carrier.save
      redirect_to insurance_carriers_path
    else
	  render "new"
    end
  end
  
  def edit
    @carrier = InsuranceCarrier.find(params[:id])
  end
  
  def update
    @carrier = InsuranceCarrier.find(params[:id])
    if @carrier.update(insurance_carrier_params)
      redirect_to @carrier
    else
      render "edit"
    end
  end
  
  def index
    if params[:limit]
      @search = InsuranceCarrier.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @carriers = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @carriers.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = InsuranceCarrier.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 100
      end
      @carriers = @search.results
      flash.discard
    end
  end

  def destroy
    @carrier = InsuranceCarrier.find(params[:id])
    @carrier.destroy
    redirect_to insurance_carriers_path
  end
  
private
  def insurance_carrier_params
    params.require(:insurance_carrier).permit(:id, :company_name, :corporate_rep_last_name,
	:corporate_rep_first_name, :corporate_rep_middle_name, :corporate_rep_prefix,
	:corporate_rep_suffix, :address_line_one, :address_line_two, :address_line_three,
	:city, :state, :zip_code, :plus_four_code, :country, :area_code, :exchange,
	:suffix, :extension, :country_code, :fax_area_code, :fax_exchange, :fax_suffix,
	:email_address, :created_at, :updated_at, insurance_companies_attributes: [:id, :insurance_carrier_id,
    :company_name, :corporate_rep_last_name, :corporate_rep_first_name,
    :corporate_rep_middle_name, :corporate_rep_prefix, :corporate_rep_suffix,
    :address_line_one, :address_line_two, :address_line_three,
	:city, :state, :zip_code, :plus_four_code, :country, :area_code, :exchange,
	:suffix, :extension, :country_code, :fax_area_code, :fax_exchange, :fax_suffix,
	:email_address, :created_at, :updated_at])
  end
end
