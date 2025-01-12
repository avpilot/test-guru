module TestPassagesHelper
  def result_message(test_passage)
    ending = test_passage.success? ? ' test passed successfully!' : ' test failed...'
    test_passage.test.title + ending
  end

  def result_color(test_passage)
    test_passage.success? ? 'green' : 'red'
  end

  def passage_progress(test_passage)
    "#{test_passage.current_question_number}/#{test_passage.test.questions.count}"
  end
end
