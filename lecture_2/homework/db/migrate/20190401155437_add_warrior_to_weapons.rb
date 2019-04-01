class AddWarriorToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :weapons, :warrior, foreign_key: true, index: true
  end
end
