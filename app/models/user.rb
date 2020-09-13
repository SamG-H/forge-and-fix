class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :username, presence: true
  has_many :projects
  has_many :tasks
  has_many :issues, through: :tasks

  def self.find_or_create_with_oauth(auth)
    return user = User.find_by_uid(auth["uid"]) if user
    user = User.new
    user.username = auth["extra"]["raw_info"]["login"]
    user.uid = auth["uid"]
    user.password = SecureRandom.hex(20)
    user.save
    user
  end
  
end
