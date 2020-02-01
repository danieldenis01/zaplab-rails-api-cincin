class V1::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wine
  before_action :set_review, only: %i[update show destroy]

  def index
    @reviews = @wine.reviews.order(created_at: :desc)

    render json: @reviews
  end

  def create
    @review = @wine.reviews.new review_params
    @review.reviewer = current_user

    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def update
    if @review.update review_params
      render json: @review, status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @review
  end

  def destroy
    @review.destroy
    head :no_content
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def set_wine
    @wine = Wine.find params[:wine_id]
  end

  def set_review
    @review = @wine.reviews
                   .where(reviewer_id: current_user.id)
                   .find params[:id]
  end
end
