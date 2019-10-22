# frozen_string_literal: true

# class ImageUploader
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb_carousel do
    process resize_to_fill: [840, 460]
  end

  version :thumb_all do
    process resize_to_fill: [450, 320]
  end

  version :thumb do
    process resize_to_fill: [320, 320]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fill: [40, 40]
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
