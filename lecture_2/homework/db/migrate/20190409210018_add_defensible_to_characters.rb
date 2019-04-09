class AddDefensibleToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :characters, :defensible, polymorphic: true, index: true
  end
end
