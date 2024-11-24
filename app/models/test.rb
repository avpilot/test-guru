class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.by_category(category)
    includes(:category).where(category: { title: category }).order('tests.title DESC')
                       .pluck(:title)
  end
end
