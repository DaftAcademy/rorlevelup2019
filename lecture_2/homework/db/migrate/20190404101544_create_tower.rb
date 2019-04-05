# frozen_string_literal: true

class CreateTower < ActiveRecord::Migration[5.2]
  def change
    create_table :towers, &:timestamps
  end
end
