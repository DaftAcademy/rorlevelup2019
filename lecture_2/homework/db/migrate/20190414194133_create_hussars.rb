class CreateHussars < ActiveRecord::Migration[5.2]
  def change
    create_table :hussars do |t|

      t.timestamps
    end
  end
end
