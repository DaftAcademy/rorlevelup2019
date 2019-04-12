class AddDefaultsOnMercenary < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :mercenaries, :experience, from: 0, to: 0
    change_column_default :mercenaries, :available_from, from: "2019-04-12 08:37:01", to: "2019-04-12 08:37:01"
  	change_column_default :mercenaries, :price, from: 1, to: 1
  end
end
