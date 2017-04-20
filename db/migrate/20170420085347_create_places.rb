class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
