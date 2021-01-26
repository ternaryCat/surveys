class Survey < ApplicationRecord
  validates :title, presence: true

  has_many :questions, dependent: :destroy
  has_many :options, through: :questions
  has_many :answers, through: :options
end
