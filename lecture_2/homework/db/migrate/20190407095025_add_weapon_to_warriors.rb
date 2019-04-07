# frozen_string_literal: true

class AddWeaponToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :weapons, :warrior, foreign_key: true, index: true, unique: true
  end
end
