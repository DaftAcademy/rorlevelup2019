class MercenaryQuery

  def self.available_from(relation: Mercenary.all, time: Time.now) do
    relation.where('available_from < ?', time)
  end

  def self.order_by_price(relation: Mercenary.all, order: :asc) do
    relation.order(price: :order)
  end

end
