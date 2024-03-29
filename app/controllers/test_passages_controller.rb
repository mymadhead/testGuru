# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      awarded_badges = Awarder.new(@test_passage).call
      current_user.badges << awarded_badges

      session[:badges] = awarded_badges&.pluck(:name, :url)

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render 'show'
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question.body, gist_url: result.html_url, user_id: current_user.id)
      flash[:notice] = "#{t('.success')} #{view_context.link_to(t('.view'), result.html_url, target: '_blank')}"
    else
      flash[:alert] = t('.fail')
    end
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
