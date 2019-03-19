class AddSamuraiToClan < ActiveRecord::Migration[5.2]
  def change
    add_reference :clans, :samurai, foreign_key: true
  end
end
