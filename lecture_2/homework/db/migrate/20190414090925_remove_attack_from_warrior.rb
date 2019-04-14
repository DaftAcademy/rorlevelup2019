class RemoveAttackFromWarrior < ActiveRecord::Migration[5.2]
  def change
    remove_column :warriors, :attack
  end
end
