class User < ApplicationRecord
  has_many :tests
  has_many :test_passages
  has_many :tests, through: :test_passages
  
  def test_passages(level)
    TestPassage.where(user: self)
               .includes(:test).where(test: { level: level }).joins(:test).pluck(:title)
  end
end
