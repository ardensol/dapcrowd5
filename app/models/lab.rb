class Lab < ActiveRecord::Base
  attr_accessible :description, :image, :name, :show, :mainoptions_attributes
  has_many :mainoptions, dependent: :destroy
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :mainoptions, allow_destroy: true
  has_attached_file :image, styles: {
    medium: '300x300>',
    large: '512x512>'
  }
  
end
