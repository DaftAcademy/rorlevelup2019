class AddUniqueNameToMercenary < ActiveRecord::Migration[5.2]
  def change
  	add_index :mercenaries, :name, unique: true
  end
end
