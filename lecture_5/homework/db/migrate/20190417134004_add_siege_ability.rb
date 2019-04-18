class AddSiegeAbility < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :siege_ability, :integer, default: 0, null: false
  end
end
