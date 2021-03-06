# t.string   "title"
# t.string   "subdomain"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.string   "image"
# t.string   "seo_title"
# t.string   "seo_description"
# t.string   "seo_keywords"
# t.string   "category_spec"
# t.text     "header_addit"
# t.string   "firm_purpose"
# t.string   "footer_text"
# t.string   "h1_text"


class Category < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  acts_as_taggable_on :prices

  has_many :products, dependent: :destroy
  has_and_belongs_to_many :articles

  validates_presence_of :image

end
