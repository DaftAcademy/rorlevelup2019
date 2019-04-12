class AddPreferableWarriorType < ActiveRecord::Migration[5.2]
  def change
    add_column :mercenaries, :preferred_warrior_type, :string, default: 'Warriors::Hussar'
  end
end
