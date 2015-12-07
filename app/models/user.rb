class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :calendars, dependent: :nullify
  has_many :projects, dependent: :nullify
  belongs_to :project

end
