class AddHorsesAndNormalUnitsToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :horse_units, :integer
    add_column :buildings, :infantry_units, :integer
  end
end
