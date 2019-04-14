# frozen_string_literal: true

class MercenaryQuery
  def self.not_hired_by_others(relation: Warrior)
    relation.where(warrior_id: nil)
  end

  def self.free_at_now(relation: Warrior)
    relation.where('available_from < ?', Time.now)
  end

  def self.best(relation: Warrior)
    relation.order(experience: :desc, price: :asc).first
  end
end
