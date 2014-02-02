class Invite < ActiveRecord::Base
  belongs_to :inviter
  belongs_to :invitee
end
