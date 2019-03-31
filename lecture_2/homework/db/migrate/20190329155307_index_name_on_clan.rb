class IndexNameOnClan < ActiveRecord::Migration[5.2]
  def change
    add_index :warriors, :name, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
