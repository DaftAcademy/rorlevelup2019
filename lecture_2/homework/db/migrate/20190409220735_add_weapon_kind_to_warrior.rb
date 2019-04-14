# frozen_string_literal: true

class AddWeaponKindToWarrior < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :weapon_kind, :string
  end
end
