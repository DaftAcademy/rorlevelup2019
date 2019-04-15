class MercenariesQuery

  def self.find_mercenary(relation: Mercenary, id: nil)
    if id
      relation.find(id)
    else
      relation
        .where('warrior_id IS NULL AND available_from < ?', Time.now)
        .order(experience: :desc, price: :asc)
        .first
    end
  end

  def self.available(relation: Mercenary)
    mercenary = relation
      .where('warrior_id IS NULL AND available_from < ?', Time.now)
      .all
  end

  def self.unavailable(relation: Mercenary)
    mercenary = relation
      .where('warrior_id IS NOT NULL OR available_from > ?', Time.now)
      .all
  end
end
