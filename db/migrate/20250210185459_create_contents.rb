class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.timestamps
    end
    add_reference :apps, :content, foreign_key: true

  end
end
