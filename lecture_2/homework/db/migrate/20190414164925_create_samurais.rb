# frozen_string_literal: true

class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais, &:timestamps
  end
end
