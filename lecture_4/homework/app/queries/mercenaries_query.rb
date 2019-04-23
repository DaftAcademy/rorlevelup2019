# frozen_string_literal: true

class MercenariesQuery
  attr_reader :relation

  def initialize(relation = Mercenary.all)
    @relation = relation
  end

  def available_from(time = Time.now)
    relation.where('available_from < ?', time).all
  end

  def first_in_order_of(sort_direction = 'asc', sort_type = 'price', _time = Time.now)
    direction = sort_direction.to_s
    type = sort_type.to_sym
    relation.order(type => direction).first
  end
end
