class CreateRangers < ActiveRecord::Migration[5.2]
  def change
    create_table :rangers do |t|

      t.timestamps
    end
  end
end
