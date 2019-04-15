# frozen_string_literal: true

class CreateMagicalWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :magical_weapons, &:timestamps
  end
end
