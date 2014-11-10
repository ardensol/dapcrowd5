class Profile < ActiveRecord::Base
  attr_accessible :avatar, :height, :weight, :about, :location, :byline, :savings
  belongs_to :user

end