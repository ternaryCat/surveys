module Api
  module V1
    class SurveysController < ApiController
      def index
        render json: { surveys: SurveyShortSerializer.new(Survey.all) }
      end

      def create
        survey = Surveys::Create.call(survey_params.to_h)
        return render(json: {}, status: :bad_request) unless survey

        render json: { survey: SurveySerializer.new(survey) }, status: :created
      rescue KeyError => e
        return render json: { message: t('surveys.errors.missing_key') }, status: :bad_request
      end

      private

      def survey_params
        params.permit(:title,
                      options: [:title, :weight, :answer_index, :question_index],
                      answers: [:title, :description],
                      questions: [:title]
        )
      end
    end
  end
end
