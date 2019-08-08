class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         :lockable,
         :omniauth_providers => [:facebook]

  # validates :first_name, :last_name, :email, presence: true
  
  after_create :create_profile
  after_create :send_welcome_email

  has_one :profile, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :subs, dependent: :destroy
  has_many :images, dependent: :destroy


  def full_name
    unless self.first_name == nil
      self.first_name + " " + self.last_name
    end
  end


  def self.logins_before_captcha
    3
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # def send_devise_notification(notification, *args)
  #   devise_mailer.send(notification, self, *args).deliver_later
  # end

  def get_newsfeed
    # friendships = "SELECT requestee_id FROM friendships WHERE requestor_id = :user_id AND accepted = true"
    # reverse_friendships = "SELECT requestor_id FROM friendships WHERE requestee_id = :user_id AND accepted = true"
    # Category.where("user_id IN (#{friendships}) OR user_id IN (#{reverse_friendships}) OR user_id = :user_id", user_id: self.id)

    Category.where("user_id = :user_id", user_id: self.id)
  end

  def send_welcome_email()
# UserMailer.welcome_email(self).deliver
    user = self
    Resque.enqueue(WelcomeEmailJob, user)
  end

end
