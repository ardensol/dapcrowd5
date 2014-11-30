class Affiliate < ActiveRecord::Base

	has_many :referred_records
    
    validates_presence_of :name, :path

    def referred_users
      referred_records.includes(:user).collect(&:user).compact
    end

    def referred_payments
      referred_records.includes({:user => :payments}).collect{|u| u.user.payments }.flatten.compact
    end

    def referred_count
      referred_records.count
    end

    def get_layout
      return false if layout == 'false'
      layout
    end
end