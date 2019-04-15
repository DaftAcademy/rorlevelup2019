# frozen_string_literal: true

class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.integer :damage, default: 10
      t.integer :range, default: 1
      t.string :type, default: 'MeleeWeapon'
      t.timestamps
    end
  end
end
