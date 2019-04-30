# frozen_string_literal: true

class AddMeWpnableToMeleeWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :melee_weapons, :me_wpnable, polymorphic: true, index: true
  end
end
