# frozen_string_literal: true

class CreateSwords < ActiveRecord::Migration[5.2]
  def change
    create_table :swords, &:timestamps
  end
end
