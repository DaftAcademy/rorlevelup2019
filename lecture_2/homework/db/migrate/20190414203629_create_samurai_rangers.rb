# frozen_string_literal: true

class CreateSamuraiRangers < ActiveRecord::Migration[5.2]
  def change
    create_table :samurai_rangers, &:timestamps
  end
end
