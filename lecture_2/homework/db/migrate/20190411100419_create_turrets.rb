class CreateTurrets < ActiveRecord::Migration[5.2]
  def change
    create_table :turrets do |t|

      t.timestamps
    end
  end
end
