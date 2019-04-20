class AddNameUniquenessToWarrior < ActiveRecord::Migration[5.2]
  def change
    remove_index :warriors, :clan_id
    add_index :warriors, [:clan_id, :name], unique: true, where: "death_date IS NULL"
  end
end
