class Project < ActiveRecord::Base
  belongs_to :user
  has_many :users, dependent: :nullify
end
