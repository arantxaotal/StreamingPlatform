class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.integer :number, null: false
      t.string :original_title, null: false
      t.integer :year
      t.integer :duration_in_seconds
      #pertenece a una app de tipo tv show
      t.references :app, null: false, foreign_key: true
      t.json :availabilities
      t.timestamps
    end
  end
end
