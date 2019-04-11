class AddAttributesToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_column :weapons, :range, :integer
    add_column :weapons, :damage, :integer
  end
end
