class Sub < ApplicationRecord
  belongs_to :subable, polymorphic: true
  belongs_to :user
  belongs_to :category, -> { where(subs: {subable_type: 'Category'}) }, foreign_key: 'subable_id'

  validates :subable_id, :subable_type, :user_id, presence: true
  validates :user_id, uniqueness: {scope: [:subable_id, :subable_type]}

  def category
    return unless subable_type == "Category"
    super
  end
end
