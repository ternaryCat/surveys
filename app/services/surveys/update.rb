module Surveys
  class Update < BaseService
    param :survey
    option :title
    option :answers_params
    option :questions_params
    option :options_params

    def call
      survey.title = title
      answers = make_records Answer, answers_params
      completed_questions_params = questions_params.map { |params| params.merge survey: survey }
      questions = make_records Question, completed_questions_params
      options = make_options answers, questions
      return nil unless valid? survey, answers, questions, options

      survey.save
      answers = answers.each(&:save)
      questions = questions.each(&:save)
      options = options.each(&:save)

      destroy_extra_answers answers
      destroy_extra_questions questions
      destroy_extra_options options

      survey
    end

    private

    def destroy_extra_answers(answers)
      answers_ids = answers.map { |answer| answer[:id] }
      survey.answers.where.not(id: answers_ids).destroy_all
    end

    def destroy_extra_questions(questions)
      questions_ids = questions.map { |question| question[:id] }
      survey.questions.where.not(id: questions_ids).destroy_all
    end

    def destroy_extra_options(options)
      options_ids = options.map { |option| option[:id] }
      survey.options.where.not(id: options_ids).destroy_all
    end

    def valid?(survey, answers, questions, options)
      survey.valid? && valid_collection?(answers) && valid_collection?(questions) && valid_collection?(options)
    end

    def valid_collection?(collection)
      collection.each { |record| return false if record.invalid? }

      true
    end

    def make_records(model, collection)
      collection.map do |item|
        next model.new(item) unless item.key? :id

        record = model.find(item[:id])
        record.assign_attributes(item)
        record
      end
    end

    def make_options(answers, questions)
      options_params.map do |option_data|
        option_params = option_data.slice :id, :title, :weight, :answer_id, :question_id
        option_params[:answer] = answers[option_data[:answer_index]] if option_data[:answer_index]
        option_params[:question] = questions[option_data[:question_index]] if option_data[:question_index]
        next Option.new(option_params) unless option_params.key? :id

        record = Option.find(option_params[:id])
        record.assign_attributes(option_params)
        record
      end
    end
  end
end
