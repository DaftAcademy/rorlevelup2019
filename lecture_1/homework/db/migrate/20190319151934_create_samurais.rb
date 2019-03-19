class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name
      t.integer :armor
      t.integer :battles
      t.datetime :died_at
      t.references :clan, foreign_key: true

      t.timestamps
    end
  end
end
