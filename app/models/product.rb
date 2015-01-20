class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  acts_as_taggable


  belongs_to :category

  validates_presence_of :category_id, :image, :article

end
