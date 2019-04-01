class CreateBarricades < ActiveRecord::Migration[5.2]
  def change
    create_table :barricades do |t|
      t.string :name, null: false
      t.integer :amount_of_wood, default: 0
      t.timestamps
    end
  end
end
