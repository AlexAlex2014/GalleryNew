class ImageEmailJob
  @queue = :image

  def self.perform(image)
    UserMailer.image_email(image).deliver
  end
end