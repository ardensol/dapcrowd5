class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, 
    :wants_admin_payment_notification, :landing_page

  # Validate presence of user inputs.
  # (most in this model are handled by Devise -- email, password, and password_confirmation)
  validates :fullname, presence: true

  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.fullname = auth.info.name   # assuming the user model has a name
  end
end

end
