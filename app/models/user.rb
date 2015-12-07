class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :calendars, dependent: :nullify
  has_many :projects, dependent: :nullify
  belongs_to :project

  mount_uploader :image, ImageUploader

  def full_name
    "#{first_name} #{last_name}".strip
  end

end
