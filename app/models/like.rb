# frozen_string_literal: true

# class Like
class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true
  belongs_to :user

  validates :likable_id, :likable_type, :user_id, presence: true
  validates :user_id, uniqueness: { scope: %i[likable_id likable_type] }
end
