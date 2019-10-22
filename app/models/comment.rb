# frozen_string_literal: true

# class Comment
class Comment < ApplicationRecord
  extend FriendlyId
  friendly_id :commenter, use: :slugged

  belongs_to :user, optional: true
  belongs_to :image

  validates :image_id, :user_id, presence: true
end
