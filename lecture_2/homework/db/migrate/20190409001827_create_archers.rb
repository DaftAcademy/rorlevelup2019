class CreateArchers < ActiveRecord::Migration[5.2]
  def change
    create_table :archers do |t|

      t.timestamps
    end
  end
end
