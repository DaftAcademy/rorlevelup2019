# frozen_string_literal: true

class CreateHussarWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :hussar_warriors, &:timestamps
  end
end
