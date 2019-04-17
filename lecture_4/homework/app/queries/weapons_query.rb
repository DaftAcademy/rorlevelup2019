# frozen_string_literal: true

class WeaponsQuery
  def self.find_by_id(id = nil, relation: Weapon)
    id.nil? ? relation.first : relation.find(id)
  end
end
