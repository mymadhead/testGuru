# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    successful?
    save!
  end

  def completed?
    current_question.nil?
  end

  def success_rate
    ((correct_questions.to_f / test.questions.count) * 100).round.to_i
  end

  def successful?
    success_rate >= 85
  end

  def question_count
    test.questions.order(:id).where('id <= :current', current: current_question.id).count
  end

  def timer?
    test.time.present?
  end

  def timer
    test.time * 60
  end

  def time_left
    (created_at + timer - Time.current).to_i
  end

  def time_over?
    timer? && time_left <= 0
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def next_question
    if current_question.nil?
      test.questions.order(:id).first
    else
      test.questions.order(:id).where('id > :current', current: current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
