class AddTypeColumToWarrior < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :type, :string, default: 'Samurai'
  end
end
