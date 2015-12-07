class DashboardsController < ApplicationController

  def show
    @user = User.find params[:id]
    @projects = Project.all
    @project = Project.new
  end

  def index

  end


end
