class V1::WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wine, only: %i[update show destroy]

  def index
    @wines = Wine.order(:name)

    render json: @wines
  end

  def create
    @wine = Wine.new wine_params

    if @wine.save
      render json: @wine, status: :created
    else
      render json: @wine.errors, status: :unprocessable_entity
    end
  end

  def update
    if @wine.update wine_params
      render json: @wine, status: :ok
    else
      render json: @wine.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @wine
  end

  def destroy
    @wine.destroy
    head :no_content
  end

  private

  def set_wine
    @wine = Wine.find params[:id]
  end

  def wine_params
    params.require(:wine)
          .permit(:name, :price, :available, :manufactory_by_id)
  end
end
