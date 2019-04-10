class AddTypeToWarriors < ActiveRecord::Migration[5.2]
  def change 
  	add_column :warriors, :type, :string 
  end
end
