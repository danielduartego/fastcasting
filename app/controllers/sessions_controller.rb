class SessionsController < ApplicationController

  def new
    # if current_user
    #   redirect_to dashboards_path
    # end
  end

  def create
    user = User.find_by_email params[:email]
    # user bg
     if user && user.authenticate(params[:password]) && user.role.nil?
       session[:user_id] = user.id
       redirect_to user_path(current_user)
    # user agent
    elsif user && user.authenticate(params[:password]) && user.role?
      session[:user_id] = user.id
      redirect_to dashboard_path(current_user)
    # user diretor
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path(current_user)
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
