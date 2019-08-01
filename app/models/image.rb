class Image < ApplicationRecord
  extend FriendlyId

  friendly_id :body, use: :slugged

  mount_uploader :image, ImageUploader

  # validates :body, presence: true
  # validates :image, presence: true
  validates :image, file_size: { less_than: 50.megabytes }

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
  belongs_to :category

end
