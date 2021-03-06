# frozen_string_literal: true

# class User
class User < ApplicationRecord
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         :lockable,
         omniauth_providers: [:facebook]

  validates :email, presence: true

  after_create :create_profile
  after_create :send_welcome_email

  has_one :profile, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :subs, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :actions, dependent: :destroy

  def full_name
    return if self.first_name.nil?

    self.first_name + ' ' + self.last_name
  end

  def self.logins_before_captcha
    2
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # def get_newsfeed
  #   Category.where('user_id = :user_id', user_id: self.id)
  # end

  def send_welcome_email
    return if Rails.env.test?

    user = self
    Resque.enqueue(WelcomeEmailJob, user)
    # UserMailer.welcome_email(self).deliver
  end
end
