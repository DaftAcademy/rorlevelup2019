# frozen_string_literal: true

class CreateWands < ActiveRecord::Migration[5.2]
  def change
    create_table :wands, &:timestamps
  end
end
