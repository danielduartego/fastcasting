class BookingsController < ApplicationController

  before_action :authenticate_user

  def create
    @booking = Booking.new
    @project = Project.find params[:project_id]
    @booking.project = @project
    @booking.user = User.find params[:user_id]
    if @booking.save
      redirect_to dashboards_path, notice: "success"
    else
      redirect_to dashboards_path, notice: "error"
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    @booking = @project.bookings.find params[:id]
    # if @project.user == current_user
    #   # delete
    # else
    #   flash[:error] = "Not allowed to decline this booking"
    # end
    if @booking.destroy
      redirect_to project_path(@project), notice: "Background deleted successfully"
    else
      redirect_to project_path(@project), alert: "Error"
    end

  end


end
