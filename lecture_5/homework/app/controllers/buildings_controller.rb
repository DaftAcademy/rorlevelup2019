# frozen_string_literal: true

class BuildingsController < ApplicationController
  def index
    render json: buildings, status: 200
  end

  def show
    render json: building
  end

  private

  def buildings
    @buildings ||= fetch_buildings.present? ? fetch_buildings : NoBuildings.new.buildings
  end

  def fetch_buildings
    BuildingsQueries.buildings(relation: Building)
  end

  def building
    @building = BuildingsQueries.building(relation: Building, id: params[:id])
  end
end
