class TemplatesController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def show
	@template = Template.find(params[:id])
  end
  
  def new
    @template = Template.new
  end
  
  def create
    @template = Template.new(template_params)
    if @template.save
      redirect_to templates_path
    else
	  render "new"
    end
  end
  
  def edit
    @template = Template.find(params[:id])
  end
  
  def update
    @template = Template.find(params[:id])
	if @template.update(template_params)
      redirect_to template_path(@template)
    else
      redirect_to :back
      flash[:alert] = "Template " << @template.errors.full_messages.first.to_s
    end
  end
  
  def index
    if params[:limit]
      @search = Template.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @templates = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @templates.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = Template.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 10
      end
      @templates = @search.results
      flash.discard
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to templates_path
  end

  private
  def template_params
    params.require(:template).permit(:id, :name, :template_type, :file,
    :user_id, :private, :created_at, :updated_at)
  end

end
