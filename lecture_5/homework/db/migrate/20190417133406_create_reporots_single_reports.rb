class CreateReporotsSingleReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reporots_single_reports do |t|

      t.timestamps
    end
  end
end
