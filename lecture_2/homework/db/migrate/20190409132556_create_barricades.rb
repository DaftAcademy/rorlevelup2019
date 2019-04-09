class CreateBarricades < ActiveRecord::Migration[5.2]
  def change
    create_table :barricades do |t|

      t.timestamps
    end
  end
end
