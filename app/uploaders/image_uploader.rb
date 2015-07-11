# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  after :store, :send_feedback_email

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :thumb do
    # process resize_and_pad: [150, 150, '#FFFFFF']
    # process :auto_orient
    # process resize_to_fill: [550, 380]
    process resize_to_fill: [300, 207]
  end

  # def default_url
  #   # ActionController::Base.helpers.asset_path('avatar.png')
  #   'avatar.png'
  # end

  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  def send_feedback_email(file)
    return unless model.kind_of?(Feedback)
    return if model.is_send?
    OrderMailer.new_order(model).deliver
    model.update is_send: true
  end

end
