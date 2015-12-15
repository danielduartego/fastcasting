class DashboardsController < ApplicationController

  before_action :authenticate_user

  def show
    if current_user.role.nil?
      redirect_to user_path(current_user)
    else
      @users = User.where(:role => nil)
      @projects = Project.all.order(:shoot_date)
      @project = Project.new
      @calendars = Calendar.all
      @calendar = Calendar.new
      @bookings = Booking.all
    end
  end

  def index
    # @users = User.all #users_for_role(current_user.type_of_role)
    # @projects = Project.all.order(:shoot_date)
    # @project = Project.new
    # @calendars = Calendar.all
    # @calendar = Calendar.new
    # @bookings = Booking.all
  end


end
