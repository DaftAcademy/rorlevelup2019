class AddEquipmentToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :equipment, polymorphic: true, index: true
  end
end
