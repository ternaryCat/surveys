class Question < ApplicationRecord
  validates :title, presence: true

  belongs_to :survey
  has_many :options, dependent: :destroy
end
