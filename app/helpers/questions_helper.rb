module QuestionsHelper
  def question_header(question)
    if question.new_record?
      'Create New Question'
    elsif question.persisted?
      "Edit #{question.test.title} Question"
    end
  end
end
