class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :inviter, index: true
      t.references :invitee, index: true
      t.string :code

      t.timestamps
    end
  end
end
