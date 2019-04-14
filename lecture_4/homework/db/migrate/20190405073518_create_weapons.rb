# frozen_string_literal: true

class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.belongs_to :warrior, foreign_key: true
      t.integer :range
      t.integer :damage
      t.string :kind
      t.string :type, null: false

      t.timestamps
    end

    add_column :warriors, :preferred_weapon_kind, :string
  end
end
