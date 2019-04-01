class BarricadesController < ApplicationController
  def index
    barricade = Barricade.all
    render json: barricade
  end

  def show
    render json: barricade
  end

  def create
    barricade = Barricade.create!(barricade_params)
    render json: barricade, status: 201
  end

  private

  def barricade_params
    params.permit(:name, :amount_of_wood)
  end

  def barricade
    @barricade ||= Barricade.find_by!(id: params[:id])
  end
end
