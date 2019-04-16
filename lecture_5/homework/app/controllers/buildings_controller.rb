# frozen_string_literal: true

class BuildingsController < ApplicationController
  def index
    render json: Building.all
  end

  def show
    render json: building
  end

  private

  def building
    @building || Building.find(params[:id])
  end
end
