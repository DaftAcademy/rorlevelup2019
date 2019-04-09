class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|

      t.timestamps
    end
  end
end
