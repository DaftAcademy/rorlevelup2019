# frozen_string_literal: true

class MercenariesQuery
  def self.available(relation: Mercenary)
    relation.where(warrior_id: nil).where('available_from < ?', Time.now)
  end

  def self.cheapest(relation: Mercenary)
    relation.order(price: :asc).first
  end
end
