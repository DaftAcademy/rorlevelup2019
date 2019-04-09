class CreateMagicalWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :magical_weapons do |t|

      t.timestamps
    end
  end
end
