class AddHorseToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :horse, :boolean, default: false
  end
end
