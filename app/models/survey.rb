class Survey < ApplicationRecord
  validates :title, presence: true

  has_many :answers, dependent: :destroy
  has_many :options, through: :answers
end
