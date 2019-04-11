# frozen_string_literal: true

class CreateBarricades < ActiveRecord::Migration[5.2]
  def change
    create_table :barricades, &:timestamps
  end
end
