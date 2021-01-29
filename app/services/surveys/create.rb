module Surveys
  class Create < BaseService
    option :title
    option :answers_params
    option :questions_params
    option :options_params

    def call
      survey = Survey.new title: title
      answers = initialized_answers
      questions = initialized_questions survey
      options = initialized_options answers, questions
      return nil unless valid? survey, answers, questions, options

      survey.save
      answers.each(&:save)
      questions.each(&:save)
      options.each(&:save)

      survey
    end

    private

    def valid?(survey, answers, questions, options)
      survey.valid? && valid_collection?(answers) && valid_collection?(questions) && valid_collection?(options)
    end

    def valid_collection?(collection)
      collection.each { |record| return false if record.invalid? }

      true
    end

    def initialized_answers
      answers_params.map { |answer_params| Answer.new answer_params }
    end

    def initialized_questions(survey)
      questions_params.map { |question_params| Question.new question_params.merge(survey: survey) }
    end

    def initialized_options(answers, questions)
      options_params.map do |option_data|
        option_params = option_data.slice(:title, :weight).merge(
          answer: answers[option_data[:answer_index]],
          question: questions[option_data[:question_index]]
        )

        Option.new option_params
      end
    end
  end
end
