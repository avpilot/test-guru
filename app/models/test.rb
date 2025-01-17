class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :simple, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, ->(category) { joins(:category).where(category: { title: category }) }
  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: 'the same title and level already exists' }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.titles_by_category(category)
    by_category(category).order('tests.title DESC').pluck(:title)
  end
end
