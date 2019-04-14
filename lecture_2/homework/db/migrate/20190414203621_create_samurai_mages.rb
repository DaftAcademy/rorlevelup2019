class CreateSamuraiMages < ActiveRecord::Migration[5.2]
  def change
    create_table :samurai_mages do |t|

      t.timestamps
    end
  end
end
