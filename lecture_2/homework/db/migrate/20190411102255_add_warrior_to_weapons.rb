# frozen_string_literal: true

class AddWarriorToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :weapons, :warrior, foreign_key: true
    add_column :weapons, :type, :string, default: 'Malee'
  end
end
