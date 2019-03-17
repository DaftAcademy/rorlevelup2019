class RenameIt < ActiveRecord::Migration[5.2]
  def change
    rename_column :samurais, :end, :death
    add_reference :samurais, :clan
  end
end
