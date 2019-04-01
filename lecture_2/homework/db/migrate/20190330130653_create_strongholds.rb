class CreateStrongholds < ActiveRecord::Migration[5.2]
  def change
    create_table :strongholds do |t|
      t.string :name, null: false
      t.integer :number_of_bricks, default: 0
      t.timestamps
    end
  end
end
