class CreateBows < ActiveRecord::Migration[5.2]
  def change
    create_table :bows do |t|

      t.timestamps
    end
  end
end
