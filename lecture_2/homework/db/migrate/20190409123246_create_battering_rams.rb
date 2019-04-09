class CreateBatteringRams < ActiveRecord::Migration[5.2]
  def change
    create_table :battering_rams do |t|

      t.timestamps
    end
  end
end
