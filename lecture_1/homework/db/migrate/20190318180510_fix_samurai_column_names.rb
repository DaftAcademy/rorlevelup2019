class FixSamuraiColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :samurais, :battles, :battles_count
    rename_column :samurais, :deathtime, :died_at
  end
end
