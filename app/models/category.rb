# frozen_string_literal: true

# class Category
class Category < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  has_many :subs, as: :subable, dependent: :destroy

  # validates :title, presence: true, length: { minimum: 4 }
end
