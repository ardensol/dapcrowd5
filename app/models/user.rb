class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, :dependent => :destroy, autosave: true
  has_many :store_credits
  accepts_nested_attributes_for :profile       
  has_many :comments
  acts_as_voter
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, 
    :wants_admin_payment_notification, :landing_page, :avatar, :profile_attributes, :referral_code, :affiliate_code

  has_attached_file :avatar, :styles => {:medium => "225x225#", :thumb => "90x90>", :mini => "40x40#"}, :default_url => ActionController::Base.helpers.asset_path("/CrowdTiltOpen/assets/profile_default.png") 
  # Validate presence of user inputs.
  # (most in this model are handled by Devise -- email, password, and password_confirmation)
  validates :fullname, presence: true

  devise :omniauthable, :omniauth_providers => [:facebook]


  #Setup affiliate and referral tracking
  has_one :referral
  has_one :referred_record
  has_one :affiliate, through: :referred_record, foreign_key: :affiliate_id
  has_one :affiliate_record, class_name: ReferredRecord

  attr_accessor :referral_code, :affiliate_code

  after_create :create_referral
  after_create :referral_affiliate_check

  def referred_by
    referred_record.try(:referral).try(:user)
  end
  
  def referred_count
    referral.referred_records.count
  end

  def referred?
    !referred_record.try(:referral).try(:user).nil?
  end

  def affiliate?
    !affiliate.nil?
  end

  #OMNIAUTH

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.fullname = auth.info.name   # assuming the user model has a name
      user.avatar = URI.parse(auth.info.image) if auth.info.image?
      user.build_profile
      user.save
    end
  end


  def has_store_credit?
    store_credits.present?
  end

  def store_credits_total
    store_credits.sum(:remaining_amount)
  end


  private
      def referral_affiliate_check
        if !self.referral_code.nil?
          referred = Referral.where(code: referral_code).first
          store_credit = StoreCredit.new
          store_credit.user = self
          store_credit.amount = 10
          store_credit.remaining_amount = 10
          store_credit.reason = "referred"
          store_credit.save
        elsif !self.affiliate_code.nil?
          referred = Affiliate.where(path: affiliate_code).first
        end
        if referred
          referred.referred_records.create(user: self)

        end
      end

end
