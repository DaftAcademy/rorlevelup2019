class CreateWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :warriors do |t|

      t.timestamps
    end
  end
end
