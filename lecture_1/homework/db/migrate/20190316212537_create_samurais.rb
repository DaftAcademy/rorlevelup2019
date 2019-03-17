class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name
      t.integer :armor
      t.integer :battles
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
