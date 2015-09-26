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
  has_many :articles, through: :category

  validates_presence_of :category_id, :image, :article

  def all_tags
    category.price_list.map do |tag|
      t_array = tag.split("-").map(&:to_i)
      left, right = t_array.first, t_array.last
      (left..right).include?(price) ? tag : nil
    end.compact + tag_list
  end

  def viewed_price
    price.present? ? price * 1000 : nil
  end

end
