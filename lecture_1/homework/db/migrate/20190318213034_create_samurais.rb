class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name
      t.integer :armor
      t.integer :skirmishes, :default => 0
      t.datetime :death
      t.timestamps
    end
  end
end
