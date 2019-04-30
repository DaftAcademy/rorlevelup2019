# frozen_string_literal: true

class CreateSamuraiWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :samurai_warriors, &:timestamps
  end
end
