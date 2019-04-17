# frozen_string_literal: true

class BuildingsController < ApplicationController
  def index
    render json: Building.all.includes( warriors: [:weapon, :clan]), include: :warriors
  end

  def show
    render json: building, include: :warriors
  end

  private

  def building_params
    params.permit(:name)
  end

  def building
    @building ||= Building.find(params[:id])
  end
end
