# frozen_string_literal: true

class MercenariesQuery
  def self.available(relation: Mercenary)
    relation.where(warrior_id: nil)
            .where('available_from < ?', Time.now)
  end

  def self.price_asc(relation: Mercenary)
    relation.order(price: :asc)
  end

  def self.exp_desc(relation: Mercenary)
    relation.order(experience: :desc)
  end
end
