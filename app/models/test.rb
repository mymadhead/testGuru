class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.array_name_tests(category)
    joins(category)
      .where(categories: { name: category })
      .order(title: :desc).pluck(:title)
  end
end
