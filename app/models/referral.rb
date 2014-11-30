class Referral < ActiveRecord::Base
	belongs_to :user
    has_many :referred_records

    validates_presence_of :user_id, :code

    before_validation :attach_code, on: :create

    def referred_users
      referred_records.includes(:user).collect(&:user).compact
    end

    def referred_payments
      referred_records.includes({:user => :payments}).collect{|u| u.user.payments }.flatten.compact
    end

    protected
      def attach_code
        self.code = loop do
          code =  (0...8).map { (65 + rand(26)).chr }.join
          break code unless Referral.exists?(code: code)
        end
      end

end