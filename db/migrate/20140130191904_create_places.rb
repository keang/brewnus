class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
