class CreateBrewers < ActiveRecord::Migration
  def change
    create_table :brewers do |t|
      t.string :name
      t.string :password
      t.references :inviter, index: true

      t.timestamps
    end
  end
end
