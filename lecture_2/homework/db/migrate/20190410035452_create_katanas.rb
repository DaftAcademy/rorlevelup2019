# frozen_string_literal: true

class CreateKatanas < ActiveRecord::Migration[5.2]
  def change
    create_table :katanas, &:timestamps
  end
end
