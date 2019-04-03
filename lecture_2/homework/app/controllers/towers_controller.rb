class TowersController < ApplicationController
  def index
    render json: Tower.all
  end

  def show
    render json: tower
  end

  def create
    tower = Tower.create!(tower_params)
    render json: tower
  end

  private

  def tower
    @tower ||= Tower.find(params[:id])
  end

  def tower_params
    params.permit(:name)
  end
end
