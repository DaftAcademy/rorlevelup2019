class AddDefaultsToSamurai < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :samurais,
      :armour,
      0
    )
    change_column_default(
      :samurais,
      :battles,
      0
    )
  end
end
