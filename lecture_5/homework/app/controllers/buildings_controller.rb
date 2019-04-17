# frozen_string_literal: true

class BuildingsController < ApplicationController
  def index
    render json: Building.all, include: [:warriors], status: 200
  end

  def create
    building = Building.create!(building_params)

    render json: building, include: [:warriors], status: 201
  end

  def show
    render json: building, include: [:warriors], status: 200
  end

  private

  def building
    @building ||= Building.find(params[:id])
  end

  def building_params
    params.permit(:name, :type, :granary)
  end
end
