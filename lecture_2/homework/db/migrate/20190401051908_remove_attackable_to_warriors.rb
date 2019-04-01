class RemoveAttackableToWarriors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :warriors, :attackable, polymorphic: true
  end
end
