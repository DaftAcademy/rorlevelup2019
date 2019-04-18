# frozen_string_literal: true

class BuildingsController < ApplicationController
  def index
    render json: buildings, status: 200
  end

  def show; end

  private

  def buildings
    @buildings ||= BuildingsQueries.buildings(relation: Building)

    { message: NoBuildings.new.buildings } if @buildings.empty?
  end
end
