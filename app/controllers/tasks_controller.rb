class TasksController < ApplicationController

  def create
    @project = Project.find(task_params[:project_id])
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to @project
    else
      @tasks = @project.tasks
      render "projects/show"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority, :project_id)
  end
end
