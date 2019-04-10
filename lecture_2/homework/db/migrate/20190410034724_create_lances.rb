class CreateLances < ActiveRecord::Migration[5.2]
  def change
    create_table :lances do |t|

      t.timestamps
    end
  end
end
