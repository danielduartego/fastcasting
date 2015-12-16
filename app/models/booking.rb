class Booking < ActiveRecord::Base

  # validates :user, uniqueness: true

  belongs_to :user
  belongs_to :project

end
