class Prototype < ActiveRecord::Base
  acts_as_votable
  has_attached_file :image, styles: {
    medium: '300x300>',
    large: '512x512>'
  }
  attr_accessible :image, :name, :show

  def score
    self.get_upvotes.size
  end
end
