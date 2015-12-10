class DashboardsController < ApplicationController

  def show

  end

  def index
    @users = User.all #users_for_role(current_user.type_of_role)
    @projects = Project.all
    @project = Project.new
    @calendars = Calendar.all
    @calendar = Calendar.new
  end


end
