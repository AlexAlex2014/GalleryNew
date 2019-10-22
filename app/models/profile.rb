# frozen_string_literal: true

# class Profile
class Profile < ApplicationRecord
  belongs_to :user
end
