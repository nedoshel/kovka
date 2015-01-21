class Feedback < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :product_id, :name, :phone, :email
  validates :email, email: true

end
