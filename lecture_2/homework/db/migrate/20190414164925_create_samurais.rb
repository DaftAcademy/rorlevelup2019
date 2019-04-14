class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|

      t.timestamps
    end
  end
end
