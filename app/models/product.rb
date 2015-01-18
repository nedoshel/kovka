class Product < ActiveRecord::Base

  mount_uploader :image
  acts_as_taggable


  belongs_to :category

  validates_presence_of :category_id, :image, :article

end
