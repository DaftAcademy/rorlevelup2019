class AddNullsToMercenary < ActiveRecord::Migration[5.2]
  def change
    change_column_null :mercenaries, :name, false
    change_column_null :mercenaries, :experience, false
    change_column_null :mercenaries, :preferred_weapon_kind, false
    change_column_null :mercenaries, :available_from, false
    change_column_null :mercenaries, :price, false
  end
end
