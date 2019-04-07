# frozen_string_literal: true

class AddWeaponToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :weapon, :string
  end
end
