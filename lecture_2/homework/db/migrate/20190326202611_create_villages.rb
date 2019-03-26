class CreateVillages < ActiveRecord::Migration[5.2]
  def change
    create_table :villages do |t|

      t.timestamps
    end
  end
end
