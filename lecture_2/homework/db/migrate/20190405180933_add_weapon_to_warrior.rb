# frozen_string_literal: true

class AddWeaponToWarrior < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :weapon_of_choice, :string
  end
end
