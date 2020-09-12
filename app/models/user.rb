class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :username, presence: true
  has_many :projects
  has_many :issues, through: :tasks
end
