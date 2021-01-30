module Api
  module V1
    class SurveysController < ApiController
      def index
        render json: { surveys: SurveyShortSerializer.new(Survey.all) }
      end

      def show
        render json: { survey: SurveySerializer.new(survey) }
      end

      def create
        survey = Surveys::Create.call survey_params.to_h
        return render(json: {}, status: :bad_request) unless survey

        render json: { survey: SurveySerializer.new(survey) }, status: :created
      rescue KeyError
        render json: { message: t('surveys.errors.missing_key') }, status: :bad_request
      end

      def update
        updated_survey = Surveys::Update.call survey, survey_params.to_h
        return render(json: {}, status: :bad_request) unless updated_survey

        render json: { survey: SurveySerializer.new(updated_survey) }, status: :ok
      rescue KeyError
        render json: { message: t('surveys.errors.missing_key') }, status: :bad_request
      end

      private

      def survey
        @survey ||= Survey.find(params[:id])
      end

      def survey_params
        params.permit(:title,
                      options_params: %i[id title weight answer_index question_index],
                      answers_params: %i[id title description],
                      questions_params: %i[id title])
      end
    end
  end
end
