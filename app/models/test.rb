# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :tests_passages
  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true



  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :advanced, -> { where(level: (5..Float::INFINITY)) }

  scope :from_category, (->(name) { joins(:category).where(categories: { name: name }).order(title: :desc).pluck })

  def self.title_from_category(name)
    from_category(name).pluck(:title)
  end
end
