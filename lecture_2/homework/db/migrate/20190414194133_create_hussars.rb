# frozen_string_literal: true

class CreateHussars < ActiveRecord::Migration[5.2]
  def change
    create_table :hussars, &:timestamps
  end
end
