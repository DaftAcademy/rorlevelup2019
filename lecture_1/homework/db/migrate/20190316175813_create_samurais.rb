class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name, null: false
      t.integer :armor, null: false
      t.integer :battles, null: false
      t.date :join_date
      t.date :death_date
      t.references :clan, foreign_key: true, index: true
      t.timestamps
    end
  end
end
