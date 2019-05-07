class RenameStrongholdTableToStrongholds < ActiveRecord::Migration[5.2]
  def change
    rename_table :stronghold, :strongholds
  end
end
