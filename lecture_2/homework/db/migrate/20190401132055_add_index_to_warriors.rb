class AddIndexToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_index :warriors, [:name, :clan_id], unique: true, where: "death_date IS NULL"
  end
end
