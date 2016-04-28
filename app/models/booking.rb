class Booking < ActiveRecord::Base

  validates :user, uniqueness: { scope: :project }

  belongs_to :user
  belongs_to :project

end
