# frozen_string_literal: true

class NullMercenary
  def choose_class(clan:)
    self
  end

  def create!(name:, clan:, building:, preferred_weapon_kind:, mercenary:)
    nil
  end

  def experience
    nil
  end

  def name
    nil
  end

  def preferred_weapon_kind
    nil
  end

  def available_from
    nil
  end

  def price
    nil
  end

  def warrior
    nil
  end
end
