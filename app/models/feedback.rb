class Feedback < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :product

  validates_presence_of :product_id, :name, :phone, :email
  validates :email, email: true


  after_create :send_mail


  def order_name
    if image.present?
      "Индивидуальный заказ №#{id}"
    else
      product.article
    end
  end

  def subject
    if image.present?
      "Индивидуальный заказ №#{id} от #{name}"
    else
      "Заявка на #{product.article} от #{name}"
    end
  end


  private
    def send_mail
      return if image.present?
      OrderMailer.new_order(self).deliver
      update is_send: true
    end
end
