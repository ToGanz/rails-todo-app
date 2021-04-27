class ProjectsController < ApplicationController
  def index
    @project = Project.new
    @projects = Project.all
  end

  def create
    @projects = Project.all
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project was successfully created."
      redirect_to projects_path
    else
      render :index
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
