class BookingsController < ApplicationController

  before_action :authenticate_user

  def create
    @booking = Booking.new
    @project = Project.find params[:project_id]
    @booking.project = @project
    @booking.user = User.find params[:user_id]
    if @booking.save
      redirect_to dashboard_path(current_user), notice: "Background add to the project"
    else
      redirect_to dashboard_path(current_user), alert: "This background is already on this project"
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    @booking = @project.bookings.find params[:id]
    if @booking.destroy
      redirect_to project_path(@project), notice: "Background deleted successfully"
    else
      redirect_to project_path(@project), alert: "Error"
    end
  end

  def update
    @project = Project.find params[:project_id]
    @booking = @project.bookings.find params[:id]
    booking_params = params.require(:booking).permit(:user_id, :project_id, :accepted)
    if @booking.update booking_params
      redirect_to project_path(@project)
    else
      redirect_to project_path(@project)
    end
  end

end
