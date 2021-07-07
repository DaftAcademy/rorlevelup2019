# frozen_string_literal: true

class CreateTrenches < ActiveRecord::Migration[5.2]
  def change
    create_table :trenches, &:timestamps
  end
end
