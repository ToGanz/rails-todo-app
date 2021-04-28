class ProjectsController < ApplicationController
  def index
    @project = Project.new
    @projects = Project.all
  end

  def show 
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @task = Task.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project was successfully created."
      redirect_to projects_path
    else
      @projects = Project.all
      render :index
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
