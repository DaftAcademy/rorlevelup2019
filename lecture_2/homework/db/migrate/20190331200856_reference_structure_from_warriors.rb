class ReferenceStructureFromWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :structure
  end
end
