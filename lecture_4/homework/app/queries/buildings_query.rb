# frozen_string_literal: true

class BuildingsQuery
  def self.find_building(params)
    Building.find(params[:building_id]) if params[:building_id]
  end
end
