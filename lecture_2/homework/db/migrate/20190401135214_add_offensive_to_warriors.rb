class AddOffensiveToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :offensive, polymorphic: true, index: true
  end
end
