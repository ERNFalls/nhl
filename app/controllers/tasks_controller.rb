class TasksController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def index
	if params[:limit]
	  @search = Task.search do
		fulltext params[:search]
		paginate :page => params[:page], :per_page => params[:limit]
	  end
	  @tasks = @search.results
	  if params[:search] != ""
		flash[:alert] = "Found " << @tasks.total_entries.to_s << " Matches."
		flash.discard
	  end
	else
	  @search = Task.search do
		  fulltext params[:search]
		  paginate :page => params[:page], :per_page => 10
	  end
	  @tasks = @search.results
	  flash.discard
	end
  end

  def my_assignments
    @tasks = Task.all.where(:assigned_to => current_user.id)
  end

  def new
    @task = Task.new
  end

  def create
	@task = Task.new(task_params) 
    if @task.save
	  redirect_to tasks_path
    else
	  render "new"
    end
  end

  def createpartial
    @task = Task.new(task_params)
	if @task.save
	  redirect_to :back
	else
	  redirect_to :back
	  flash[:alert] = "Task " << @task.errors.full_messages.first.to_s
	end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      render "edit"
    end
  end

  def updatepartial
    @task = Task.find(params[:task_id])
	if @task.update(task_params)
      redirect_to :back
    else
      redirect_to :back
      flash[:alert] = "Task " << @task.errors.full_messages.first.to_s
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back
  end

  private
  def task_params
    params.require(:task).permit(:id, :task, :taskable_id, :taskable_type,
    :priority, :due_date, :created_by, :assigned_to, :status, :created_at, :updated_at)
  end
end
