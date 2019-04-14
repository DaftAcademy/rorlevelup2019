# frozen_string_literal: true

class CreateTowers < ActiveRecord::Migration[5.2]
  def change
    create_table :towers, &:timestamps
  end
end
