class WallsController < ApplicationController
  def index
    wall = Wall.all
    render json: wall
  end

  def show
    render json: wall
  end

  def create
    wall = Wall.create!(wall_params)
    render json: wall, status: 201
  end

  private

  def wall_params
    params.permit(:name, :thickness)
  end

  def wall
    @wall ||= Wall.find_by!(id: params[:id])
  end

end
