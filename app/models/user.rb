class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :calendars, dependent: :nullify
  has_many :projects, dependent: :nullify
  belongs_to :project

  mount_uploader :image, ImageUploader

  ROLE_BG = :bg
  ROLE_AGENT = :agent
  ROLE_DIRECTOR = :director

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def type_of_role
    case role
    when nil then ROLE_BG
    when true then ROLE_AGENT
    when false then ROLE_DIRECTOR
    end
  end

  def self.users_for_role(type_of_role)
    case type_of_role
    when ROLE_BG
      all
    when ROLE_AGENT
      #where( )
    when ROLE_DIRECTOR
      #where()
    end
  end

end
