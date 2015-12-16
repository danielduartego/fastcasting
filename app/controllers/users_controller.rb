class UsersController < ApplicationController

  before_action :authenticate_user, only: [:show]

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email,
                                              :password, :password_confirmation,
                                              :role, :image, pictures: [])
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user), notice: "account created!"
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    @calendars = @user.calendars
  end

end
