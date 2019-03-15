class CreateClansAndSamurais < ActiveRecord::Migration[5.2]
    def change
        create_table :clans do |t|
            t.string :name, null: false, limit: 256
        end

        create_table :samurais do |t|
            t.string :name, null: false, limit: 256
            t.integer :armor, null: false
            t.integer :battles, null: false
            t.datetime :join_date, null: false
            t.datetime :death_date, default: nil
            t.references :clan, foreign_key: true, index: true
        end
    end
end
