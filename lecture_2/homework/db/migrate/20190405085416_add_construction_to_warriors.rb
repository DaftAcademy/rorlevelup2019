class AddConstructionToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :construction, foreign_key: true
  end
end
