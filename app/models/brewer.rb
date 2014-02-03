class Brewer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :inviter
  has_one :home_base
  validates :name,
  	:uniqueness =>{
  		:case_sensitive => false
  	}
  def invite_address
  	logger.debug "nusbrew.herokuapp.com?inviter=" + name
  end

  def email_required?
  	false
  end
  def email_changed?
  	false
  end
end
