class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.integer :number, null: false
      t.string :original_title, null: false
      t.integer :year
      t.integer :duration_in_seconds
      t.references :season, null: false, foreign_key: true
      t.timestamps
    end
  end
end
