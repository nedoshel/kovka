class Feedback < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :product_id, :name, :phone, :email
  validates :email, email: true


  after_create :send_mail



  private
    def send_mail
      # OrderMailer.new_order(self).deliver
      OrderMailer.new_order.deliver
    end
end
