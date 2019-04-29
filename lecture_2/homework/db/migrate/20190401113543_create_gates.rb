# frozen_string_literal: true

class CreateGates < ActiveRecord::Migration[5.2]
  def change
    create_table :gates, &:timestamps
  end
end
