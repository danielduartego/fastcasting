class DashboardsController < ApplicationController

  def show

  end

  def index
    @users = User.all
    @projects = Project.all
    @project = Project.new
    @calendars = Calendar.all
  end


end
