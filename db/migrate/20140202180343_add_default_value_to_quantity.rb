class AddDefaultValueToQuantity < ActiveRecord::Migration
  def change
  	change_column :stocks, :quantity, :integer, default:0
  end
end
