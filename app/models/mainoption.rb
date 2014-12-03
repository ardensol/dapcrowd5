class Mainoption < ActiveRecord::Base
  attr_accessible :description, :image, :name, :show, :lab_id, :estimated_price, :number_of_backers
  acts_as_votable
  belongs_to :lab

   has_attached_file :image, styles: {
    medium: '300x',
    large: '512x512>'
  }

  def score
    self.get_upvotes.size
  end
end
