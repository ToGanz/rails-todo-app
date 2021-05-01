class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to @project
    else
      @finished_tasks = @project.tasks.select(&:completed)
      @unfinished_tasks = @project.tasks.select { |task| !task.completed }
      render "projects/show"
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task was successfully updated."
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "Task deleted"
    redirect_to @project
  end

  def complete
    @task.update(completed: !@task.completed)
    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority)
  end
end
