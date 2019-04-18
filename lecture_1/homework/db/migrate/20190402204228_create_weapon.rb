class CreateWeapon < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :type, null: false, default: 'melee'
      t.integer :range, null: false
      t.references :warrior, foreign_key: true
    end
  end
end
