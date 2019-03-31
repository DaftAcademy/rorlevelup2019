class IndexNameOnClans < ActiveRecord::Migration[5.2]
  def change
    add_index :clans, :name, unique: true, where: "name != 'unnamed'"
    change_column_default :clans, :name, "unnamed"
  end
end
