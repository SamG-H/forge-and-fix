class Project < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true
  belongs_to :user
  has_many :issues, dependent: :destroy

  scope :list_category, ->(category_search) { where("category == ?", category_search) }
  def self.order_by_issue_count
    Project.left_joins(:issues).group(:id).order('COUNT(issues.id) DESC')
  end
end
