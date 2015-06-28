class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:show, :update, :destroy]

  # GET /recommendations
  # GET /recommendations.json
  def index
    recommendations = Recommendations.All
    render json: @recommendations
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
    render json: @recommendation
  end

  # POST /recommendations
  # POST /recommendations.json
  def create
    @recommendation = Recommendation.new(recommendation_params)

    if @recommendation.save
      render json: @recommendation, status: :created, location: @recommendation
    else
      render json: @recommendation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recommendations/1
  # PATCH/PUT /recommendations/1.json
  def update
    @recommendation = Recommendation.find(params[:id])

    if @recommendation.update(recommendation_params)
      render json: @recommendation, status: :updated
    else
      render json: @recommendation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recommendations/1
  # DELETE /recommendations/1.json
  def destroy
    @recommendation.destroy

    head :no_content
  end

  private

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:alcohol,:sport,:eaten,:checkin_start,:recomendation,:high_level)
  end
end
