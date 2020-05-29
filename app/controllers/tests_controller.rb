class TestsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: rescue_with_test_not_found

  def index
    render plain: Test.all.select(:id, :title).inspect
  end

  def show
    @test = Test.find(params[:id])
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test not found!'
  end
end
