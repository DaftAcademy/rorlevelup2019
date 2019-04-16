class DropStrongholds < ActiveRecord::Migration[5.2]
  def change
    drop_table :strongholds
  end
end
