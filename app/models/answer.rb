class Answer < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :options, dependent: :destroy
  has_many :answers_posts, dependent: :destroy
  has_many :questions, through: :options
  has_many :posts, through: :answers_posts
end
