class MakeClanNamesUnique < ActiveRecord::Migration[5.2]
  def change
    change_column :clans, :name, :string, unique: true
  end
end
