class Option < ApplicationRecord
  validates :title, presence: true
  validates :weight, presence: true

  belongs_to :answer
end
