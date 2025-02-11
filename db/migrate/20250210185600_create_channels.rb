class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.integer :number, null: false
      #pertenece a una app de tipo channel
      t.references :app, null: false, foreign_key: true
      t.timestamps
    end
  end
end
