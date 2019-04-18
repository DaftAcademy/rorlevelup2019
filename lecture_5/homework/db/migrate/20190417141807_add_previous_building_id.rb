class AddPreviousBuildingId < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :prev_building_id, :integer
  end
end
