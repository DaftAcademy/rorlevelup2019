# frozen_string_literal: true

class RenameSamurai < ActiveRecord::Migration[5.2]
  def change
    rename_table :samurais, :warriors
    add_column :warriors, :type, :string, default: 'Samurai'
  end
end
