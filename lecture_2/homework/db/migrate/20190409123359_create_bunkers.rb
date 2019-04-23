# frozen_string_literal: true

class CreateBunkers < ActiveRecord::Migration[5.2]
  def change
    create_table :bunkers, &:timestamps
  end
end
