class AddSamuraisJoinDate < ActiveRecord::Migration[5.2]
  def change
    add_column :samurais, :joined, :datetime
  end
end
