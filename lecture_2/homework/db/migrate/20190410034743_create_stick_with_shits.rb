class CreateStickWithShits < ActiveRecord::Migration[5.2]
  def change
    create_table :stick_with_shits do |t|

      t.timestamps
    end
  end
end
