class CreateTowers < ActiveRecord::Migration[5.2]
  def change
    create_table :towers do |t|
      t.string :name, null: false
      t.integer :heigh, default: 0
      t.timestamps
    end
  end
end
