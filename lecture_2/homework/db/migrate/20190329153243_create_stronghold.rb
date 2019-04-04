# frozen_string_literal: true

class CreateStronghold < ActiveRecord::Migration[5.2]
  def change
    create_table :strongholds do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
