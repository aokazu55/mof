class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :line, null: false
      t.string :station, null: false
      t.integer :minute, null: false

      t.timestamps
    end
  end
end
