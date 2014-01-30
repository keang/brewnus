class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :brew, index: true
      t.references :brewer, index: true
      t.references :place, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
