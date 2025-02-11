class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.tests.new(test_params)
    @test.author = current_user

    if @test.save
      redirect_to admin_tests_url
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_url
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_url
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
