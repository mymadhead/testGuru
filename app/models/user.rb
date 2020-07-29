# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :successful_test_passages, -> { where(success: true) }, class_name: 'TestPassage'
  has_many :tests, through: :test_passages

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :confirmable,
         :validatable

  def list_all_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    first_name.nil? ? email : first_name
  end

end
