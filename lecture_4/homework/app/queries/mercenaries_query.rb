# frozen_string_literal: true

class MercenariesQuery
  def self.currently_available(relation: Mercenary)
    relation.where('available_from < ?', Time.now)
  end

  def self.most_experienced(relation: Mercenary)
    relation.order(experience: :desc).first
  end

  def self.employed(relation: Mercenary)
    relation.where('warrior_id IS NOT NULL')
  end

  def self.unemployed(relation: Mercenary)
    relation.where('warrior_id IS NULL')
  end


end
