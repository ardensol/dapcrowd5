class ReferredRecord < ActiveRecord::Base
	belongs_to :referral
    belongs_to :user
    belongs_to :affiliate

    validates_presence_of :user

    attr_accessible :user
  
end