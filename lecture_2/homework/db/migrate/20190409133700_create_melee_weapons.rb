class CreateMeleeWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :melee_weapons do |t|

      t.timestamps
    end
  end
end
