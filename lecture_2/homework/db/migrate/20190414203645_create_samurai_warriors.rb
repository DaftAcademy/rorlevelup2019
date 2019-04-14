class CreateSamuraiWarriors < ActiveRecord::Migration[5.2]
  def change
    create_table :samurai_warriors do |t|

      t.timestamps
    end
  end
end
