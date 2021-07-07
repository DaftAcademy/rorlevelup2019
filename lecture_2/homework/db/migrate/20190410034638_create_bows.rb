# frozen_string_literal: true

class CreateBows < ActiveRecord::Migration[5.2]
  def change
    create_table :bows, &:timestamps
  end
end
