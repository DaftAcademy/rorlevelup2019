# frozen_string_literal: true

class CreateMeleeWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :melee_weapons, &:timestamps
  end
end
