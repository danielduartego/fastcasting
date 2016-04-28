class DashboardsController < ApplicationController

  before_action :authenticate_user

  def show
    if current_user.role.nil?
      redirect_to user_path(current_user)
    else
      @users = User.where(:role => nil)
      @projects = Project.all.where("shoot_date >= ?", Time.zone.today).order(:shoot_date)
      @project = Project.new
      @calendars = Calendar.all
      @calendar = Calendar.new
      @bookings = Booking.all
    end
  end

  def index
    redirect_to dashboard_path(current_user)
    # @users = User.all #users_for_role(current_user.type_of_role)
    # @projects = Project.all.order(:shoot_date)
    # @project = Project.new
    # @calendars = Calendar.all
    # @calendar = Calendar.new
    # @bookings = Booking.all
  end


end
