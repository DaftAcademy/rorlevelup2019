class CreateCastles < ActiveRecord::Migration[5.2]
  def change
    create_table :castles do |t|
      t.string :name, null: false
      t.integer :number_of_residents, default: 0
      t.timestamps
    end
  end
end
