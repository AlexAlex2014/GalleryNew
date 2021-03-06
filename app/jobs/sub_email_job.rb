# frozen_string_literal: true

# class SubEmailJob
class SubEmailJob
  @queue = :sub

  def self.perform(sub)
    UserMailer.sub_email(sub).deliver
  end
end
