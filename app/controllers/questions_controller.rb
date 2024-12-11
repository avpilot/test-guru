class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show
    @question = @test.questions.find(params[:id])
  end

  def new; end

  def delete
    Question.destroy(params[:id].to_i)
    redirect_to test_questions_path
  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render inline: '<p>Question id:<%= params[:id] %> was not found</p>'
  end
end
