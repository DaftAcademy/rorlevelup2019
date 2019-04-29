# frozen_string_literal: true

class AddIndexToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_index :warriors, %i[name clan_id], unique: true, where: 'death_date IS NULL'
  end
end
