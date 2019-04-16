# frozen_string_literal: true

module Queries
  class MercenariesQuery
    def self.find_by_id(id = nil, relation: Mercenary)
      id.nil? ? relation.first : relation.find(id)
    end

    def self.available(relation: Mercenary)
      relation.where('available_from < ? and warrior_id is null', Time.now)
    end

    def self.sort_exp_descending(relation: Mercenary)
      relation.order(experience: :desc)
    end

    def self.sort_price_ascending(relation: Mercenary)
      relation.order(price: :asc)
    end

    def self.sort_available_exp_descending(relation: available)
      relation.order(experience: :desc)
    end

    def self.sort_available_price_ascending(relation: available)
      relation.order(price: :asc)
    end
  end
end
