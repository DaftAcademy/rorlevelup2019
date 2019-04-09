class CreateRangedWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :ranged_weapons do |t|

      t.timestamps
    end
  end
end
