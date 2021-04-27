class ProjectsController < ApplicationController
  def index
    @project = Project.new
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project was successfully created."
    end
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
