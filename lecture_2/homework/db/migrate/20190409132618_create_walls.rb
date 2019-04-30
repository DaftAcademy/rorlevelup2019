# frozen_string_literal: true

class CreateWalls < ActiveRecord::Migration[5.2]
  def change
    create_table :walls, &:timestamps
  end
end
