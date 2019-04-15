class CreateFortresses < ActiveRecord::Migration[5.2]
  def change
    create_table :fortresses do |t|
      
      t.string :name, null: false
      t.boolean :fosse, default: false
      t.timestamps
    end
  end
end
