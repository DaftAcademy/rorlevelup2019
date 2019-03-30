class CreateMelees < ActiveRecord::Migration[5.2]
  def change
    create_table :melees do |t|

      t.timestamps
    end
  end
end
