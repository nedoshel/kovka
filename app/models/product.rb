# t.integer  "category_id"
# t.string   "article"
# t.text     "description"
# t.string   "image"

# t.string   "figure_alt"
# t.integer  "meta_width"
# t.integer  "meta_height"
# t.string   "tovname_title"



class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  acts_as_taggable


  belongs_to :category
  has_many :feedbacks, dependent: :nullify

  validates_presence_of :category_id, :image, :article

end
