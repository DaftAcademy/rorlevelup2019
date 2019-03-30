class CreateRangeds < ActiveRecord::Migration[5.2]
  def change
    create_table :rangeds do |t|

      t.timestamps
    end
  end
end
