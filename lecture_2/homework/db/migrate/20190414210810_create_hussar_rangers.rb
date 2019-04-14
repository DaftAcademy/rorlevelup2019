class CreateHussarRangers < ActiveRecord::Migration[5.2]
  def change
    create_table :hussar_rangers do |t|

      t.timestamps
    end
  end
end
