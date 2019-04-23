# frozen_string_literal: true

class CreateStickWithShits < ActiveRecord::Migration[5.2]
  def change
    create_table :stick_with_shits, &:timestamps
  end
end
