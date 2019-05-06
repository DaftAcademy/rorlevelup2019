class ChangeBuildingColumnsToHaveDefaultsAndNotToBeNull < ActiveRecord::Migration[5.2]
  def change
    change_column :buildings, :siege_ability, :integer, default: 0, null: false
    change_column :buildings, :horse_units, :integer, defult: 0, null: false
    change_column :buildings, :infantry_units, :integer, defult: 0, null: false
  end
end
