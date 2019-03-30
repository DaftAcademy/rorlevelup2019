class AddWarriorsNameUniqueness < ActiveRecord::Migration[5.2]
  def change
    add_index :warriors, [:clan_id, :name], unique: true, where: "death_date IS NULL"
  end
end
