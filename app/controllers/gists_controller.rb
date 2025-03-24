class GistsController < ApplicationController

  rescue_from Octokit::Error, with: :git_error
  before_action :set_test_passage, only: %i[create]

  def create
    service = gist_service
    @gist = current_user.gists.new(question: @test_passage.current_question, url: service.call['html_url'])

    if service.success?
      redirect_to @test_passage, notice: success_message if @gist.save
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def git_error
    redirect_to @test_passage, alert: t('.failure')
  end

  def gist_service
    GistQuestionService.new(
      @test_passage.current_question,
      client: Octokit::Client.new(access_token: ENV['GIST_TOKEN'])
    )
  end

  def success_message
    "#{t('.success')} <a href=\"#{@gist.url}\" target='blank'>gist_link</a>"
  end

end
