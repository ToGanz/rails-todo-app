class TasksController < ApplicationController
  before_action :set_project

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to @project
    else
      @tasks = @project.tasks
      render "projects/show"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Task was successfully updated."
      redirect_to @project
    else
      render 'edit'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority)
  end
end
