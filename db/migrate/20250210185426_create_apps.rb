class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.string :original_title, null: false
      t.integer :year
      t.integer :duration_in_seconds
      t.json :availabilities
      t.timestamps
    end
  end
end
