class Issue < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :project
  has_many :tasks, dependent: :destroy
  has_many :users, through: :tasks
end
