class ChangeSamuraisToWarriors < ActiveRecord::Migration[5.2]
  def change
    rename_table :samurais, :warriors
    add_column :warriors, :type, :string, default: 'Samurai'
  end
end
