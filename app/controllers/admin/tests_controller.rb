# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy start update_inline]
  before_action :set_tests, only: %i[index update_inline]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def edit; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      flash[:success] = t('.success')
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    flash[:danger] = t('.destroyed')
    redirect_to admin_tests_path if @test.destroy
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:level, :title, :category_id, :time)
  end
end
