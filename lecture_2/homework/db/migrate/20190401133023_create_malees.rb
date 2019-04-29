# frozen_string_literal: true

class CreateMalees < ActiveRecord::Migration[5.2]
  def change
    create_table :malees, &:timestamps
  end
end
