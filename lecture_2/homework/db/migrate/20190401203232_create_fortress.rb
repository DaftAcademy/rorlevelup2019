class CreateFortress < ActiveRecord::Migration[5.2]
  def change
    create_table :fortresses do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
