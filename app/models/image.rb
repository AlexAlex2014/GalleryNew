class Image < ApplicationRecord
  extend FriendlyId
  after_create :send_image_email

  friendly_id :body, use: :slugged

  mount_uploader :image, ImageUploader

  # validates :body, presence: true
  # validates :image, presence: true
  validates :image, file_size: { less_than: 50.megabytes }

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
  belongs_to :category

  def send_image_email()
    @image = self
    @category_sub = @image.category
    @subs = Sub.all.where("subable_id = '#{@category_sub["id"]}'")
    @emails = []
    @subs.each do |sub|
      @user = User.all.where("id = '#{sub["user_id"]}'").first
      @emails << @user['email']
    end
    if @emails.size > 0
      @emails.each do |email|
        arr = []
        arr << email
        arr << @image
        arr << @category_sub
        Resque.enqueue(ImageEmailJob, arr)
      end
    end
  end
end
