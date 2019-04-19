class CreateWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :warriors do |t|
      t.string :name
      t.integer :armour
      t.integer :battles
      t.references :clan, foreign_key: true
      t.datetime :join_date
      t.datetime :death_date
    end
  end
end
