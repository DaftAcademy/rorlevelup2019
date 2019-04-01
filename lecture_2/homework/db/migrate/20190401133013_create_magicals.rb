class CreateMagicals < ActiveRecord::Migration[5.2]
  def change
    create_table :magicals do |t|

      t.timestamps
    end
  end
end
