class Booking < ActiveRecord::Base

  # validates

  belongs_to :user
  belongs_to :project

end
