# frozen_string_literal: true

class WarriorsQuery
  def self.find_class(relation: Warrior)
    relation.select('type, count(type)').group(:type).order('count(type) ASC').first.class
  end

  def self.alive(relation: Warrior)
    relation.where('death_date IS NULL')
  end

  def self.dead(relation: Warrior)
    relation.where('death_date IS NOT NULL')
  end
end
