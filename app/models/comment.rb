class Comment < ApplicationRecord
  extend FriendlyId
  friendly_id :commenter, use: :slugged

  belongs_to :user, optional: true
  belongs_to :image
end
