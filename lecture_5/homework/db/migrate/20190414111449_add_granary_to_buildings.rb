# frozen_string_literal: true

class AddGranaryToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :granary, :integer, default: 0, null: false
  end
end
