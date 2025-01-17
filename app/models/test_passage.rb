class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: [:create, :update]

  MIN_PERCENT_TO_PASS = 85

  def completed?
    current_question.nil?
  end

  def correct_persent
    (correct_questions.to_f / test.questions.count * 100).round(2)
  end

  def success?(required_percent = MIN_PERCENT_TO_PASS)
    correct_persent >= required_percent
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def current_question_number
    test.questions.order(:id).to_a.index(current_question) + 1
  end

  private

  def before_validation_set_current_question
    if self.current_question_id?
      self.current_question = next_question
    else
      self.current_question = test.questions.first if test.present?
    end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.only_correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
