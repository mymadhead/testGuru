class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def new
    @question = Question.new
  end

  def show
    render plain: @question.body
  end

  def create
    @question = @test.questions.new(post_params)
    if @question.save
      redirect_to @test
    else
      render new
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end

  def post_params
    params.require(:question).permit(:body)
  end
end
