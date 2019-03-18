class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name
      t.integer :cuirass_quality
      t.integer :battles_count
      t.date :joined_date
      t.date :death_date
      t.references :clan, foreign_key: true

      t.timestamps
    end
  end
end
