# frozen_string_literal: true

class CreateArtilleries < ActiveRecord::Migration[5.2]
  def change
    create_table :artilleries, &:timestamps
  end
end
