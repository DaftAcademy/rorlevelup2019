class MercenaryQuery
  def self.available_now(relation: Mercenary)
    relation.where('available_from < ?', Time.now)
  end

  def self.order_by_price_asc(relation: Mercenary)
    relation.order(price: :asc)
  end

  def self.with_highest_experience(relation: Mercenary)
    relation.where(experience: relation.maximum(:experience))
  end
end