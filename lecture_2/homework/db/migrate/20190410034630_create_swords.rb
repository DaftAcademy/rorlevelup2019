class CreateSwords < ActiveRecord::Migration[5.2]
  def change
    create_table :swords do |t|

      t.timestamps
    end
  end
end
