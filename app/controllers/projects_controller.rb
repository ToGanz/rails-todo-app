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
