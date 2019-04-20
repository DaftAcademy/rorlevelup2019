# frozen_literal_string: true

class ClansQuery
  def self.find_by_id(id = nil, relation: Clan)
    id.nil? ? relation.order(warriors_count: :desc).first : relation.find(id)
  end
end
