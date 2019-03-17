class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name, null: false, limit: 256
      t.integer :armor, null: false
      t.integer :battles, null:false, default: 0
      t.datetime :killed_date, default: nil
      t.datetime :join_date, default: Time.now
      t.references :clan, foreign_key: true, index: true

      t.timestamps
    end
  end
end
