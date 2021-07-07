# frozen_string_literal: true

class CreatePeasants < ActiveRecord::Migration[5.2]
  def change
    create_table :peasants, &:timestamps
  end
end
