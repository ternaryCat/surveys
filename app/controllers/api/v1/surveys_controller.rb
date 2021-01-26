module Api
  module V1
    class SurveysController < ApiController
      def index
        render json: { surveys: SurveyShortSerializer.new(Survey.all) }
      end

      def create; end

      def update; end
    end
  end
end
