class ChangeDefaulValueBecauseOfSyntax < ActiveRecord::Migration[5.2]
  def change
    remove_column :weapons, :species
    add_column :weapons, :species, :string, default: "Melee"
  end
end
