class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :comments, as: :commentable
  belongs_to :user

  attr_accessible :main_image, :name, :sub_title, :content, :user_id, :summary
  has_attached_file :main_image, styles: {
    large: '1140x487>',
    medium: '486x324#'
  }


end
