class AddAttackableToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :attackable, polymorphic: true, index: true
  end
end
