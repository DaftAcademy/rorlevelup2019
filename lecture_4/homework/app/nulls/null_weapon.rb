# frozen_string_literal: true

# app/nulls/null_weapon.rb
module Nulls
  class NullWeapon
    def type
      'bare hands! No weapon equipped.'
    end

    def range
      nil
    end

    def damage
      nil
    end
  end
end
