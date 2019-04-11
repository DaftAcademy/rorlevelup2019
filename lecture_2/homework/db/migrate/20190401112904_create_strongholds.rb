# frozen_string_literal: true

class CreateStrongholds < ActiveRecord::Migration[5.2]
  def change
    create_table :strongholds, &:timestamps
  end
end
