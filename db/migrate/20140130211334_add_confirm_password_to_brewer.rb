class AddConfirmPasswordToBrewer < ActiveRecord::Migration
  def change
    add_column :brewers, :confirm_password, :string
  end
end
