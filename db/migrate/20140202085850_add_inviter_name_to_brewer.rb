class AddInviterNameToBrewer < ActiveRecord::Migration
  def change
    add_column :brewers, :inviter_name, :string
  end
end
