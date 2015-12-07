class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    # user bg
     if user && user.authenticate(params[:password]) && user.role.nil?
       session[:user_id] = user.id
       redirect_to user_path(current_user), notice: "welcome background performer"
    # user agent
    elsif user && user.authenticate(params[:password]) && user.role?
      session[:user_id] = user.id
      redirect_to dashboard_path(current_user), notice: "welcome director"
    # user diretor
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path(current_user), notice: "welcome casting agent"
    else
      flash[:alert] = "wrong, try again"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
