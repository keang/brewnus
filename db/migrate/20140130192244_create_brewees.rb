class CreateBrewees < ActiveRecord::Migration
  def change
    create_table :brewees do |t|
      t.string :name
      t.string :password
      t.string :invite
      t.references :inviter

      t.timestamps
    end
  end
end
