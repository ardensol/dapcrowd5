class Profile < ActiveRecord::Base
  attr_accessible :height, :weight, :about, :location, :byline, :savings
  belongs_to :user

end