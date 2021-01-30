class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new; end

  def edit; end

  def show; end
end
