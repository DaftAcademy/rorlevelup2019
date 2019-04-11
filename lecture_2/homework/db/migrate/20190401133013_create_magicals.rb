# frozen_string_literal: true

class CreateMagicals < ActiveRecord::Migration[5.2]
  def change
    create_table :magicals, &:timestamps
  end
end
