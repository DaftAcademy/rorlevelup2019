# frozen_string_literal: true

class CreateClansAndSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :clans do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :samurais do |t|
      t.string :name, null: false
      t.integer :armor_quality, default: 0
      t.integer :number_of_battles, default: 0
      t.date :join_date
      t.date :death_date
      t.references :clan, foreign_key: true, index: true
      t.timestamps
    end
  end
end
