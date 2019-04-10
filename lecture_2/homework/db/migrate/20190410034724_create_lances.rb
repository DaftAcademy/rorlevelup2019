# frozen_string_literal: true

class CreateLances < ActiveRecord::Migration[5.2]
  def change
    create_table :lances, &:timestamps
  end
end
