class DashboardsController < ApplicationController

  before_action :authenticate_user
  
  def show
    @users = User.all #users_for_role(current_user.type_of_role)
    @projects = Project.all.order(:shoot_date)
    @project = Project.new
    @calendars = Calendar.all
    @calendar = Calendar.new
    @bookings = Booking.all
  end

  def index
    @users = User.all #users_for_role(current_user.type_of_role)
    @projects = Project.all.order(:shoot_date)
    @project = Project.new
    @calendars = Calendar.all
    @calendar = Calendar.new
    @bookings = Booking.all
  end


end
