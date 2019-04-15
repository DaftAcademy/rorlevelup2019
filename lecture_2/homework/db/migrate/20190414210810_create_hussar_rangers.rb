# frozen_string_literal: true

class CreateHussarRangers < ActiveRecord::Migration[5.2]
  def change
    create_table :hussar_rangers, &:timestamps
  end
end
