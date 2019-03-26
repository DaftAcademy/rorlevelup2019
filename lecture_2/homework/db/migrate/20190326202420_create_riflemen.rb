class CreateRiflemen < ActiveRecord::Migration[5.2]
  def change
    create_table :riflemen do |t|

      t.timestamps
    end
  end
end
