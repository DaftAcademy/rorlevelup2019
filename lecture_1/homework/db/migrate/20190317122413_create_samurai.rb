class CreateSamurai < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.references :clan, foreign_key: true

      t.string   :name
      t.integer  :armor
      t.integer  :fought_battles, default: 0
      t.datetime :join_in
      t.datetime :death_timer

      t.timestamps
    end
  end
end
