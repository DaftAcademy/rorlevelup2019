# frozen_literal_string: true

class MercenariesQuery
  def self.find_by_id(id = nil, relation: Mercenary)
    id.nil? ? relation.first : relation.find(id)
  end

  def self.sort_exp_descending(relation: Mercenary)
    relation.order(expirience: :desc)
  end

  def self.sort_available_exp_descending(relation: available)
    relation.order(expirience: :desc)
  end

  def self.sort_available_price_ascending(relation: available)
    relation.order(price: :asc)
  end
end
