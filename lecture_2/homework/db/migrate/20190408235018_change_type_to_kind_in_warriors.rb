# frozen_string_literal: true

class ChangeTypeToKindInWarriors < ActiveRecord::Migration[5.2]
  def change
    remove_column :warriors, :type
    add_column :warriors, :kind, :string, default: 'Samurai'
  end
end
