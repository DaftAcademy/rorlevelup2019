class AddOffensiveToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :weapons, :offensive, polymorphic: true, index: true
  end
end
