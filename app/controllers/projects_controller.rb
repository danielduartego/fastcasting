class ProjectsController < ApplicationController

  before_action :authenticate_user

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find params[:id]
    @calendars = Calendar.all
    @bookings = @project.bookings
  end

  def index
    @projects = Project.all
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    if @project.destroy
      redirect_to dashboard_path(current_user)
    else
      redirect_to project_path(@project), alert: "Error"
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :shoot_date, :description)

  end

end
