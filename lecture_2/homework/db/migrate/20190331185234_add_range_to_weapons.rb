class AddRangeToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_column :weapons, :range, :integer, default: 1
  end
end
