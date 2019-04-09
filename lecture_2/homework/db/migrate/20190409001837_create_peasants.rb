class CreatePeasants < ActiveRecord::Migration[5.2]
  def change
    create_table :peasants do |t|

      t.timestamps
    end
  end
end
