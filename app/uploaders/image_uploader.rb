# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

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

  # version :thumb2 do
  #   resize_to_limit(150, nil)
  # end


  # Provide a default URL as a default if there hasn't been a file uploaded:


  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png ico)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
