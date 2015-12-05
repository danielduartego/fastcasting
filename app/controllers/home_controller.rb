class HomeController < ApplicationController

  def index
    @calendars = Calendar.all
  end

  def new
  end


end
