# frozen_string_literal: true

class AddIndexNameToWarrior < ActiveRecord::Migration[5.2]
  def change
    add_index :warriors, :name, unique: true
  end
end