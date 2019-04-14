class CreateHussarMages < ActiveRecord::Migration[5.2]
  def change
    create_table :hussar_mages do |t|

      t.timestamps
    end
  end
end
