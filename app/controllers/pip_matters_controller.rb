class PipMattersController < ApplicationController
  
  layout "main"

  #Documented Bug with CanCan - Devise that consumed an hour of my life. The workaround is just to "except: [:create]" as below. 2/15/14 - EES
  load_and_authorize_resource except: [:create]

  def show
    @pip = PipMatter.find(params[:id])
  end

  def new
    @pip = PipMatter.new
  end
 
  def create
    @pip = PipMatter.new(pip_params)
    if @pip.save
      redirect_to @pip
	else
	  render "new"
	end
  end
 
  def edit
    @pip = PipMatter.find(params[:id])
  end
  
  def update
    @pip = PipMatter.find(params[:id])
    if @pip.update(pip_params)
      redirect_to @pip
    else
      render "edit"
    end
  end

  def destroy
    @pip = PipMatter.find(params[:id])
    @pip.destroy
    redirect_to pip_matters_path
  end

  def index
    if params[:limit]
      @search = PipMatter.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @pips = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @pips.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = PipMatter.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 25
      end
      @pips = @search.results
      flash.discard
    end
  end

  private
  def pip_params
    params.require(:pip_matter).permit(:id, :medical_provider, :claimant_last_name,
    :claimant_first_name, :claimant_middle_name, :claimant_prefix, :claimant_suffix,
    :date_of_loss, :insurance_carrier, :insurance_company, :claim_no, :policy_no, :insured_name,
    :first_date_of_policy, :final_date_of_policy, :claims_adjuster, :created_at, :updated_at)
  end
end
