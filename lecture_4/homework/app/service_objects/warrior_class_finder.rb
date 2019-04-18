# frozen_string_literal: true

class WarriorClassFinder
  attr_reader :warriors, :type

  def initialize(relation: Warrior, type:)
    @warriors = relation
    @type = type
  end

  def call
    find_class
  end

  private

  def find_class
    if type && Warrior.where(type: type).present?
      eval(type)
    else
      warriors.select('type, count(type) as warriors_count')
              .group(:type)
              .order('warriors_count ASC')
              .first
              .class
    end
  end
end
