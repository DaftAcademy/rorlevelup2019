# frozen_string_literal: true

class MercenaryQuery
  def self.available(relation: Mercenary)
    relation.where('available_from <= ? AND warrior_id IS NULL', Time.now)
  end

  def self.unavailable(relation: Mercenary)
    relation.where.not('available_from <= ? AND warrior_id IS NULL', Time.now)
  end

  def self.alive(relation: Mercenary)
    relation.where('death_date IS NULL')
  end

  def self.dead(relation: Mercenary)
    relation.where('death_date IS NOT NULL')
  end

  def self.best
    available.order(price: :asc, experience: :desc).first
  end
end
