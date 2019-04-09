class MostExperiencedMercenaryFinder
  def run
    mercenaries = MercenaryQuery.available_now(relation: Mercenary.all)
    mercenaries = MercenaryQuery.with_highest_experience(relation: mercenaries)
    mercenaries = MercenaryQuery.order_by_price_asc(relation: mercenaries)
    mercenaries.first
  end
end