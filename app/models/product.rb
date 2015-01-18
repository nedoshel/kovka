class Product < ActiveRecord::Base

  attachment :image
  # = image_tag attachment_url(@product, :image, :fill, 300, 300)

  belongs_to :category

end
