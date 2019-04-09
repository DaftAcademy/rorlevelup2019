class CreateBunkers < ActiveRecord::Migration[5.2]
  def change
    create_table :bunkers do |t|

      t.timestamps
    end
  end
end
