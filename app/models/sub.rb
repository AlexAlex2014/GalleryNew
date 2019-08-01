class Sub < ApplicationRecord
  belongs_to :subable, polymorphic: true
  belongs_to :user

  validates :subable_id, :subable_type, :user_id, presence: true
  validates :user_id, uniqueness: {scope: [:subable_id, :subable_type]}
end
