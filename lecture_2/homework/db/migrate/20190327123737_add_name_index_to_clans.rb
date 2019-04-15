# frozen_string_literal: true

class AddNameIndexToClans < ActiveRecord::Migration[5.2]
  def change
    add_index :clans, :name, unique: true
  end
end