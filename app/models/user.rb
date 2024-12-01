class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true

  validates :mail, presence: true

  def test_titels_by_level(level)
    tests.where(level: level).pluck(:title)
  end
end
