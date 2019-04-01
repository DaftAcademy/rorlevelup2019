class TowersController < ApplicationController
  def index
    tower = Tower.all
    render json: tower
  end

  def show
    render json: tower
  end

  def create
    tower = Tower.create!(tower_params)
    render json: tower, status: 201
  end

  private

  def tower_params
    params.permit(:name, :heigh)
  end

  def tower
    @tower ||= Tower.find_by!(id: params[:id])
  end
end
