# frozen_string_literal: true

class MercenariesQuery
  def self.can_be_hired(mercenary_id:, relation: Mercenary)
    relation.find(mercenary_id).available_from < Time.now
  end

  def self.find_best(relation: Mercenary)
    relation.all
            .where('available_from < ? AND warrior_id IS NULL', Time.now)
            .order(experience: :desc)
            .first
  end

  def self.all_mercenaries(relation: Mercenary)
    relation.all
  end

  def self.mercenary(mercenary_id:, relation: Mercenary)
    relation.find(mercenary_id)
  end
end
