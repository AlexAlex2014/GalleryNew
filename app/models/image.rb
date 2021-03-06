# frozen_string_literal: true

# class Image
class Image < ApplicationRecord
  extend FriendlyId
  after_create :send_image_email

  paginates_per 20
  friendly_id :body, use: :slugged
  mount_uploader :image, ImageUploader

  validates :image, file_size: { less_than: 50.megabytes }

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
  belongs_to :category

  def send_image_email
    @image = self
    @category_sub = @image.category
    @subs = Sub.all.where("subable_id = '#{@category_sub['id']}'")
    @emails = []
    @subs.each do |sub|
      @user = User.all.where("id = '#{sub['user_id']}'").first
      @emails << @user['email']
    end
    email_params(@emails) unless @emails.empty?
  end

  private

  def email_params(emails)
    emails.each do |email|
      arr = []
      arr << email
      arr << @image
      arr << @category_sub
      Resque.enqueue(ImageEmailJob, arr)
    end
  end
end
