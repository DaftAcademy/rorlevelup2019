class RenameBarricadeTableToBarricades < ActiveRecord::Migration[5.2]
  def change
    rename_table :barricade, :barricades
  end
end
