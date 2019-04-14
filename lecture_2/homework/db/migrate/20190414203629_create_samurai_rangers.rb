class CreateSamuraiRangers < ActiveRecord::Migration[5.2]
  def change
    create_table :samurai_rangers do |t|

      t.timestamps
    end
  end
end
