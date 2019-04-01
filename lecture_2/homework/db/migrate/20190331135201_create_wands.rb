class CreateWands < ActiveRecord::Migration[5.2]
  def change
    create_table :wands do |t|

      t.timestamps
    end
  end
end
