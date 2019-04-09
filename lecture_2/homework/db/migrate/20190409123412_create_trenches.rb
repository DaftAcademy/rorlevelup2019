class CreateTrenches < ActiveRecord::Migration[5.2]
  def change
    create_table :trenches do |t|

      t.timestamps
    end
  end
end
