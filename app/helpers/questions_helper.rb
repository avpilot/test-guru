module QuestionsHelper
  def question_header(action_name, test_title)
    case action_name
      when 'new' then "Create New #{test_title} Question" 
      when 'edit' then "Edit #{test_title} Question" 
    end
  end
end
