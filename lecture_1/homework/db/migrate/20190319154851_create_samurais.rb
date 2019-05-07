# frozen_string_literal: true

class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.references :clan, foreign_key: true
      t.string :name
      t.integer :armour_rating
      t.integer :battle_count
      t.date :join_date
      t.date :death_date, null: true
      t.timestamps
    end
  end
end
