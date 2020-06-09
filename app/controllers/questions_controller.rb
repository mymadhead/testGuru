class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[update edit show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def new
    @question = Question.new
  end

  def edit; end

  def update
    if @question.update(post_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def show
    @question.body
  end

  def create
    @question = @test.questions.new(post_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @test = @question.test
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
