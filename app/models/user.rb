class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_attached_file :avatar, :styles => {
    :medium => "300x300>",
    :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :giftlists
  has_many :gifts

  def self.sign_in_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      # user.oauth_token = auth.credentials.token
      # user.save!
    end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update(params, *options)
    else
      super
    end
  end

  def facebook_friends
    ff = HTTParty.get("https://graph.facebook.com/me?fields=id,name,friends&access_token=#{ENV['FACEBOOK_ACCESS_TOKEN']}")
  end
    # ff = HTTParty.get("https://graph.facebook.com/me?fields=id,name,friends&access_token=#{ENV['FACEBOOK_ACCESS_TOKEN']}CAAJZA7iSPUswBAD0ZAiFziYWWAZAZC1ZBhhOCAtdhWA8sHZAfD97Mdvi24KK8E8ZAmxgBdE4AQMqe6MQpraIVEoyoBZBNpWvA8VKEPn9RZCqIP7Bwxg6P3PV0JUAPXnO0NssLOiJB8R1NyotDexWi9N7n9Vn0X9dpW4YO17ZBkCVz8wGn4STUJt5jIiayeOplxG6Yr1si6vUgMrgZDZD")
end
