class Answer < ApplicationRecord
  validates :title, presence: true

  belongs_to :survey
  has_many :options, dependent: :nullify
  has_many :answers_posts, dependent: :destroy
  has_many :posts, through: :answers_posts
end
