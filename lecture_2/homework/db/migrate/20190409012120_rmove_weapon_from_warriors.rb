# frozen_string_literal: true

class RmoveWeaponFromWarriors < ActiveRecord::Migration[5.2]
  def change
    remove_column :warriors, :weapon
  end
end
