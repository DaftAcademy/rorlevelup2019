# frozen_string_literal: true

class BuildingsController < ApplicationController
  def index
    render json: Building.all.order(:id), include: :warriors
  end

  def show
    render json: building, include: :warriors
  end

  private

  def build_params
    params.permit(:id, :name)
  end

  def building
    @building ||= Building.find(params[:id])
  end
end
