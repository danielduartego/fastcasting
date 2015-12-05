class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])

      if session[:user_id] = user.id boolean :nil
        redirect_to root_path
      else
        redirect_to "/users/new"
      end
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


#fazer o current_user_bg, current_user_agent e current_user_director, cada um baseado no boolean nill, true e false.
