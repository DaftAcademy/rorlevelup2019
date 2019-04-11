class MercenariesQuery
  def self.currently_available(relation: Mercenary)
    relation.where('available_from < ?', Time.now)
  end
end
