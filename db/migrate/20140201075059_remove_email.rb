class RemoveEmail < ActiveRecord::Migration
  def change
    change_column :brewers, :email, :string, :null => true 
  end
end