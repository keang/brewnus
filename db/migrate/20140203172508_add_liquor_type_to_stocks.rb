class AddLiquorTypeToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :liquor_type, :string, default:"Other"
  end
end
