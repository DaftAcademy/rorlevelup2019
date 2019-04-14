class CreateHussarWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :hussar_warriors do |t|

      t.timestamps
    end
  end
end
