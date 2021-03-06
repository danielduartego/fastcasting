class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :booking_users, through: :bookings, source: :user

  scope :for_dates, -> (dates){ where(shoot_date: dates) }

end
