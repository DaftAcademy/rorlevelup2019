class AddIndexNameToClans < ActiveRecord::Migration[5.2]
  def change
    add_index :clans, :name
  end
end
