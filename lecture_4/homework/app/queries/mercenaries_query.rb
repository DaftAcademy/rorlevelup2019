# frozen_string_literal: true

class MercenariesQuery
  def self.the_best(relation: Mercenary)
    relation.where('available_from < ? and warrior_id IS ?', Time.now.in_time_zone, nil).order(experience: :desc).order(price: :asc).first
  end

  def self.available(relation: Mercenary)
    relation.where('available_from < ? and warrior_id IS ?', Time.now.in_time_zone, nil).first
  end

  def self.find(id:, relation: Mercenary)
    relation.where('warrior_id IS ?', nil).find_by(id: id)
  end

  def self.which_class(relation:)
    relation.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
  end

  def self.all(relation: Mercenary)
    relation.where('available_from < ? and warrior_id IS ?', Time.now.in_time_zone,nil).all
  end
end
