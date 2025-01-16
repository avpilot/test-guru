module TestPassagesHelper
  def passage_progress(test_passage)
    "#{test_passage.current_question_number}/#{test_passage.test.questions.count}"
  end
end
