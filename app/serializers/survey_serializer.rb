class SurveySerializer < BaseSerializer
  attributes :title
  attribute(:answers) { |survey| AnswerSerializer.new(survey.answers) }
  attribute(:questions) { |survey| QuestionSerializer.new(survey.questions) }
  attribute(:options) { |survey| OptionSerializer.new(survey.options) }
end
