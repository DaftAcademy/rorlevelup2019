# frozen_string_literal: true

class DefaultValueInWeaponsSpecies < ActiveRecord::Migration[5.2]
  def change
    remove_column :weapons, :species
    add_column :weapons, :species, :string, default: 'Meele'
  end
end
