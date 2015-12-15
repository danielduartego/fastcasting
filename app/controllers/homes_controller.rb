class HomesController < ApplicationController

  def index
    if current_user
      redirect_to dashboards_path
    end
    @user = User.new
  end
end
