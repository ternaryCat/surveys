class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :answers_posts, dependent: :destroy
  has_many :answers, through: :answers_posts
end
