# frozen_string_literal: true

class CreateWall < ActiveRecord::Migration[5.2]
  def change
    create_table :walls, &:timestamps
  end
end
