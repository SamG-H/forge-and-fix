class Task < ApplicationRecord
  validates :status, inclusion: { in: %w(in-progress finished) }
  
  belongs_to :user
  belongs_to :issue
end
