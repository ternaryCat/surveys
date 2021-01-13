class AnswersPost < ApplicationRecord
  belongs_to :answer
  belongs_to :post
end
