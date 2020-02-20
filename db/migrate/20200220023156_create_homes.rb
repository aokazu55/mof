class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :name, null: false
      t.integer :rent, null: false
      t.text :address, null: false
      t.integer :year, null: false
      t.text :remarks, null: false

      t.timestamps
    end
  end
end
