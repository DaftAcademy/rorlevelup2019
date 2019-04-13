# frozen_string_literal: true

class CreateConstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :constructions do |t|
      t.string :type
      t.string :location

      t.timestamps
    end
  end
end
