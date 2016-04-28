class StatusController < ApplicationController

  before_action :authenticate_user


  def create
    calendar = Calendar.find params[:calendar_id]
    user = current_user

      if calendar.unavailable && current_user == calendar.user && user.role.nil?
          calendar.save
          redirect_to current_user

      elsif calendar.available && current_user == calendar.user && user.role.nil?
          calendar.save
          redirect_to current_user

      elsif calendar.hold && user.role?
            calendar.save
            redirect_to current_user

      elsif calendar.booked && user.role?
            calendar.save
            redirect_to current_user

      elsif calendar.unbooked && user.role?
            calendar.save
            redirect_to current_user
      else
        redirect_to calendar, alert: "Error! You can't update this calendar"
      end


  end

end
