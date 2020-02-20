class AddColumnToStation < ActiveRecord::Migration[5.2]
  def change
    add_reference :stations, :home, foreign_key: true
  end
end
