# frozen_string_literal: true

# class ImageEmailJob
class ImageEmailJob
  @queue = :image

  def self.perform(arr)
    UserMailer.image_email(arr).deliver
  end
end
