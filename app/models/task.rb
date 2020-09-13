class Task < ApplicationRecord
  validates :status, presence: true
  belongs_to :user
  belongs_to :issue
end
