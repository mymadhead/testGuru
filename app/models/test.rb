# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :tests_passages
  has_many :questions, dependent: :destroy



  validates :title, presence: true, uniqueness: { scope: :level }
  validates :time, numericality: { only_integer: true, greater_than: 0 }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category_id, presence: true

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :advanced, -> { where(level: (5..Float::INFINITY)) }

  scope :from_category, (->(name) { joins(:category).where(categories: { name: name }).order(title: :desc).pluck })

  def self.title_from_category(name)
    from_category(name).pluck(:title)
  end
end
