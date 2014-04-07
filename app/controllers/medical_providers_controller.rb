class MedicalProvidersController < ApplicationController
  
  layout "main"
  
  load_and_authorize_resource

  def show
    @prov = MedicalProvider.find(params[:id])
  end
  
  def new
	@prov = MedicalProvider.new
  end

  def create
	@prov = MedicalProvider.new(medical_provider_params) 
    if @prov.save
      redirect_to medical_providers_path
	else
      render "new"
	end
  end

  def edit
    @prov = MedicalProvider.find(params[:id])
  end
  
  def update
    @prov = MedicalProvider.find(params[:id])
    if @prov.update(medical_provider_params)
      redirect_to @prov
    else
      render "edit"
    end
  end

  def index
	if params[:limit]
      @search = MedicalProvider.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @provs = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @provs.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = MedicalProvider.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 100
      end
      @provs = @search.results
      flash.discard
    end
  end
 
  def destroy
    @prov = MedicalProvider.find(params[:id])
    @prov.destroy
    redirect_to medical_providers_path
  end  
  
private
  def medical_provider_params
   params.require(:medical_provider).permit(:id, :company_name, :corporate_rep_last_name,
	:corporate_rep_first_name, :corporate_rep_middle_name, :corporate_rep_prefix,
	:corporate_rep_suffix, :address_line_one, :address_line_two, :address_line_three,
	:city, :state, :zip_code, :plus_four_code, :country, :area_code, :exchange,
	:suffix, :extension, :country_code, :fax_area_code, :fax_exchange, :fax_suffix,
	:email_address, :created_at, :updated_at)
  end
end
