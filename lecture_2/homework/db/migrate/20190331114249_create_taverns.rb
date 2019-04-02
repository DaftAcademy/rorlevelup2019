class CreateTaverns < ActiveRecord::Migration[5.2]
  def change
    create_table :taverns do |t|
      t.string :name

      t.timestamps
    end
  end
end
