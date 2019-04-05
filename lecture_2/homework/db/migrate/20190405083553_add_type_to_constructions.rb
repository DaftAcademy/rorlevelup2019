class AddTypeToConstructions < ActiveRecord::Migration[5.2]
  def change
    add_column :constructions, :type, :string, default: 'Barricade'
  end
end
