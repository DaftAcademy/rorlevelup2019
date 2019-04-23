class ChangeColumnDefaultInBuildings < ActiveRecord::Migration[5.2]
  def change
      change_column_default :buildings, :horse_units, 0
      change_column_default :buildings, :infantry_units, 0
  end
end
