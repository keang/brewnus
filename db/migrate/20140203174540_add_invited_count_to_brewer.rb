class AddInvitedCountToBrewer < ActiveRecord::Migration
  def change
    add_column :brewers, :invited_count, :integer, default:0
  end
end
