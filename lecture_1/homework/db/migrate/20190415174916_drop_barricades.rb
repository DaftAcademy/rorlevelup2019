class DropBarricades < ActiveRecord::Migration[5.2]
  def change
    drop_table :barricades
  end
end
