# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PERCENT = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_validation :before_validation_set_next_question, on: :update

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def passing_result?
    self.correct_questions >= self.test.questions.size * PERCENT
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answers
    current_question.answers.correct
  end
end
