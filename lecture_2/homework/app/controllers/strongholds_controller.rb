class StrongholdsController < ApplicationController
  def index
    stronghold = Stronghold.all
    render json: stronghold
  end

  def show
    render json: stronghold
  end

  def create
    stronghold = Stronghold.create!(stronghold_params)
    render json: stronghold, status: 201
  end

  private

  def stronghold_params
    params.permit(:name, :number_of_bricks)
  end

  def stronghold
    @stronghold ||= Stronghold.find_by!(id: params[:id])
  end
end
