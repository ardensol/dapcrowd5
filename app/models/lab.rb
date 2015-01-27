class Lab < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :campaigns
  attr_accessible :headerimage, :description, :image, :name, :show, :mainoptions_attributes, :about, :status, :vote_trigger
  acts_as_votable


  has_many :mainoptions, dependent: :destroy
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :mainoptions, allow_destroy: true
  has_attached_file :image, styles: {
    medium: '300x300>',
    large: '512x512>'
  }

  has_attached_file :headerimage, styles: {
    large: '1140x487>',
    medium: '486x324#'
  }


  def score
    self.get_upvotes.size
  end
  
end
