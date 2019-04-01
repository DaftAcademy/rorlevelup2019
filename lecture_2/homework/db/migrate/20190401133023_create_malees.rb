class CreateMalees < ActiveRecord::Migration[5.2]
  def change
    create_table :malees do |t|

      t.timestamps
    end
  end
end
