class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true

  validate :answers_count_should_by_between_one_and_four

  def answers_count_should_by_between_one_and_four
    errors.add(:answers_count, 'should be from one to four answers') unless answers.count.between?(1, 4)
  end
end
