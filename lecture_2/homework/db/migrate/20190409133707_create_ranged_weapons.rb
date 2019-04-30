# frozen_string_literal: true

class CreateRangedWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :ranged_weapons, &:timestamps
  end
end
