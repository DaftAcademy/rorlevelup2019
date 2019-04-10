# frozen_string_literal: true

class AddAttackToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :attack, :string, default: 'Punch'
    add_column :warriors, :weapon, :string
  end
end
