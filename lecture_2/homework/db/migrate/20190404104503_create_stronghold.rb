# frozen_string_literal: true

class CreateStronghold < ActiveRecord::Migration[5.2]
  def change
    create_table :strongholds, &:timestamps
  end
end
