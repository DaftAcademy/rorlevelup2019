# frozen_string_literal: true

# app/nulls/null_mercenary.rb
module Nulls
class NullMercenary
  def name
    'Name hasn\'t been initialized'
  end

  def experience
    nil
  end

  def preferred_weapon_kind
    'melee'
  end

  def available_from
    nil
  end

  def price
    nil
  end
end
end