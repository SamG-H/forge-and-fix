class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :username, presence: true
  has_many :projects
  has_many :tasks
  has_many :issues, through: :tasks

  def self.find_or_create_with_oauth(auth)
    user = User.find_or_create_by(uid: auth["uid"]) do |u|
      u.username = auth["extra"]["raw_info"]["login"]
      u.password = SecureRandom.hex(20)
    end
  end
  
end
