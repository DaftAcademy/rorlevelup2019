class AddIndexToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_index :warriors, :name, unique: true, where: "death_date IS NULL"
  end
end
