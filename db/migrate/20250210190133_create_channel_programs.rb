class CreateChannelPrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_programs do |t|
      t.string :original_title, null: false
      t.integer :year
      t.integer :duration_in_seconds
      t.references :channel, null: false, foreign_key: true
      t.json :schedule
      t.json :availabilities
      t.timestamps
    end
    #tiene tipo channel program
    add_reference :channel_programs, :content, foreign_key: true
  end
end
