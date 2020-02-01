class V1::WineriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_winery, only: %i[update show destroy]

  def index
    @wineries = Winery.order(:name)

    render json: @wineries
  end

  def create
    @winery = Winery.new winery_params

    if @winery.save
      render json: @winery, status: :created
    else
      render json: @winery.errors, status: :unprocessable_entity
    end
  end

  def update
    if @winery.update winery_params
      render json: @winery, status: :ok
    else
      render json: @winery.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @winery
  end

  def destroy
    @winery.destroy
    head :no_content
  end

  private

  def set_winery
    @winery = Winery.find params[:id]
  end

  def winery_params
    params.require(:winery).permit(:name)
  end
end
