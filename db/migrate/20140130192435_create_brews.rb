class CreateBrews < ActiveRecord::Migration
  def change
    create_table :brews do |t|
      t.string :name
      t.float :liters

      t.timestamps
    end
  end
end
