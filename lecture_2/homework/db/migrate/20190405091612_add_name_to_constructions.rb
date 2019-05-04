class AddNameToConstructions < ActiveRecord::Migration[5.2]
  def change
    add_column :constructions, :name, :string, null: false
  end
end
