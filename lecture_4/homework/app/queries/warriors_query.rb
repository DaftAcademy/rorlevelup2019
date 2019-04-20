# frozen_string_literal: true

class WarriorsQuery
  attr_reader :relation

  def initialize(relation = Warrior.all)
    @relation = relation
  end

  def warrior_class
    relation.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
  end
end
