class Profile < ActiveRecord::Base
  attr_accessible :height, :weight, :about, :location, :byline, :savings
  obfuscate_id :spin => 89490723
  belongs_to :user

end