class CreateConstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :constructions do |t|

      t.timestamps
    end
  end
end
