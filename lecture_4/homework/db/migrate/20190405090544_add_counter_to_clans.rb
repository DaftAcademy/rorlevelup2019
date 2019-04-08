class AddCounterToClans < ActiveRecord::Migration[5.2]
  def change
    add_column :clans, :warriors_count, :integer, default: 0, null: false

    Clan.find_each { |clan| clan.reset_counters(result.id, :warriors) }
  end
end
