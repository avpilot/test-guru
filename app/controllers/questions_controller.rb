class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, except: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def destroy
    @question.destroy
    redirect_to @test
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @test
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def rescue_with_question_not_found
    render inline: '<p>Question id:<%= params[:id] %> was not found</p>'
  end
end
