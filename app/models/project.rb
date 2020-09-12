class Project < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true
  belongs_to :user
  has_many :issues
end
