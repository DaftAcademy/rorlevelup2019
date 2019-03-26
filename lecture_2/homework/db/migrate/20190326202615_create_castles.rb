class CreateCastles < ActiveRecord::Migration[5.2]
  def change
    create_table :castles do |t|

      t.timestamps
    end
  end
end
