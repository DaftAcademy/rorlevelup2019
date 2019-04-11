# frozen_string_literal: true

class CreateRangeds < ActiveRecord::Migration[5.2]
  def change
    create_table :rangeds, &:timestamps
  end
end
