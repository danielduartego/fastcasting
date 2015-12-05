class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
     if user && user.authenticate(params[:password]) && user.role.nil?
       session[:user_id] = user.id
       redirect_to root_path, notice: "logged in"
    elsif user && user.authenticate(params[:password]) && user.role?
      session[:user_id] = user.id
      redirect_to new_home_path, notice: "logged in"
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_session_path, notice: "logged in"
    else
      flash[:alert] = "wrong, try again"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
