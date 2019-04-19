# frozen_string_literal: true

module QueryObjects
  class MercenaryQuery
    def self.find_by_id(id = nil, relation: Mercenary)
      if id.nil?
        relation.first
      else
        relation.find(id)
      end
    end

    def self.order_by_exp(relation: Mercenary)
      relation.order(experience: :desc)
    end

    def self.order_by_price(relation: Mercenary)
      relation.order(price: :asc)
    end

    def self.available(relation: Mercenary)
      relation.where('available_from < ? And warrior_id is null', Time.now)
    end

    def self.not_busy(relation: Mercenary)
      relation.where('available_from < ?', Time.now)
    end

    def self.available_by_exp(relation: Mercenary)
      order_by_exp(relation: available)
    end
  end
end