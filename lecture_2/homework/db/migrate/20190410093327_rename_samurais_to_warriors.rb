class RenameSamuraisToWarriors < ActiveRecord::Migration[5.2]
  def change
  	rename_table :samurais, :warriors
  end
end
