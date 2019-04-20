class CreateStrongholds < ActiveRecord::Migration[5.2]
  def change
    create_table :strongholds do |t|
      t.string :name

      t.timestamps
    end
  end
end
