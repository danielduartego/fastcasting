class DashboardsController < ApplicationController

  def show
    @user = User.find params[:id]
    @users = User.all 
    @projects = Project.all
    @project = Project.new
  end

  def index

  end


end
