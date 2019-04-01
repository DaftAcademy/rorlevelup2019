class CastlesController < ApplicationController
  def index
    castle = Castle.all
    render json: castle
  end

  def show
    render json: castle
  end

  def create
    castle = Castle.create!(castle_params)
    render json: castle, status: 201
  end

  private

  def castle_params
    params.permit(:name, :number_of_residents)
  end

  def castle
    @castle ||= Castle.find_by!(id: params[:id])
  end

end
