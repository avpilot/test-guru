class AddCurrentQuestionCorrectQuestionsToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
