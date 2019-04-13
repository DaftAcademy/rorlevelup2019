# frozen_string_literal: true

class MercenariesQuery
  def self.best_mercenary
    Mercenary.where(available: true).order(experience: :desc, price: :asc).first
  end
end
