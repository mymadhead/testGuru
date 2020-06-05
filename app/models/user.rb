class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :tests_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true
  def list_all_tests(level)
    tests.where(level: level)
  end
end
