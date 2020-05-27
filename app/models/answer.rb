class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :max_answers, on: :create
  scope :right_answer, -> { where correct: true }

  private

  def max_answers
    errors.add(question, 'У вопроса не может быть больше 4-х ответов!') if question.answers.count >= 4
  end
end
