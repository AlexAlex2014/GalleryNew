# frozen_string_literal: true

# class Sub
class Sub < ApplicationRecord
  belongs_to :subable, polymorphic: true
  belongs_to :user

  after_create :send_sub_email

  validates :subable_id, :subable_type, :user_id, presence: true
  validates :user_id, uniqueness: { scope: %i[subable_id subable_type] }

  def send_sub_email
    return if Rails.env.test?

    sub = self
    Resque.enqueue(SubEmailJob, sub)
  end
end
