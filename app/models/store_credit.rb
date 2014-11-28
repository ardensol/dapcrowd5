class StoreCredit < ActiveRecord::Base
  validates :amount, :presence => true, :numericality => true
  validates :reason, :presence => true
  validates :user, :presence => true
  attr_accessible :amount, :reason, :user_id, :remaining_amount


  belongs_to :user


end