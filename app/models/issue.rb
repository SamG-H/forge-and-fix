class Issue < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :project
  has_many :tasks, dependent: :destroy
  has_many :users, through: :tasks
  has_many :comments, dependent: :destroy
end
