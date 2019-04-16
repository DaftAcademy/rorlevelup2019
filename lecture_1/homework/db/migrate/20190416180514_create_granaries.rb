class CreateGranaries < ActiveRecord::Migration[5.2]
  def change
    create_table :granaries do |t|
      t.integer :food, null: false, default: 10
      t.references :building, foreign_key: true
    end
  end
end
