class CreateStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :structures do |t|
      t.string :type, default: 'Wall'

      t.timestamps
    end
  end
end
