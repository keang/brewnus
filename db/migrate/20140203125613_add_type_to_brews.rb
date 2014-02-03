class AddTypeToBrews < ActiveRecord::Migration
  def change
    add_column :brews, :liquor_type, :string
  end
end
