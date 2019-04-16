class AddBuildingReferenceToWarrior < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :building, index: true
  end
end
