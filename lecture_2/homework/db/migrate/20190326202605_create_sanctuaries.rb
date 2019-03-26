class CreateSanctuaries < ActiveRecord::Migration[5.2]
  def change
    create_table :sanctuaries do |t|

      t.timestamps
    end
  end
end
