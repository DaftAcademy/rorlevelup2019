# frozen_string_literal: true

class WarriorClassFinder
  def initialize(relation: Warrior)
    @warriors = relation
  end

  def call
    find_class
  end

  private

  def find_class
    @warriors.select('type, count(type) as warriors_count')
             .group(:type)
             .order('warriors_count ASC')
             .first
             .class
  end
end
