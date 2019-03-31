class RemoveDefensibleToWarriors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :warriors, :defensible, polymorphic: true
  end
end
