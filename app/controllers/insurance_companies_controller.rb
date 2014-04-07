class InsuranceCompaniesController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def new
    @carrier = InsuranceCarrier.find(params[:insurance_carrier_id])
    @insurance_carrier = @carrier.insurance_companies.new
  end

  def create
    @carrier = InsuranceCarrier.find(params[:insurance_carrier_id])
    @insurance_company = @carrier.insurance_companies.create(insurance_company_params) 
    if @insurance_company.save!
	  redirect_to @carrier
	else
	  redirect_to insurance_carriers_path
	end
  end

  def update
    @insu = InsuranceCompany.find(params[:id])
	if @insu.update(insurance_company_params)
      redirect_to insurance_carrier_path(@insu.insurance_carrier_id)
    end
  end
  
  def destroy
    @carr = InsuranceCarrier.find(params[:insurance_carrier_id])
    @insu = @carr.insurance_companies.find(params[:id])
    @insu.destroy
    redirect_to insurance_carrier_path(@carr)
  end
  
private
  def insurance_company_params
    params.require(:insurance_company).permit(:id, :insurance_carrier_id,
    :company_name, :corporate_rep_last_name, :corporate_rep_first_name,
    :corporate_rep_middle_name, :corporate_rep_prefix, :corporate_rep_suffix,
    :address_line_one, :address_line_two, :address_line_three,
	:city, :state, :zip_code, :plus_four_code, :country, :area_code, :exchange,
	:suffix, :extension, :country_code, :fax_area_code, :fax_exchange, :fax_suffix,
	:email_address, :created_at, :updated_at)
  end

end
