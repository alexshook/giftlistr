class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, :styles => {
    :medium => "300x300>",
    :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :giftlists
  has_many :gifts

# FIXME this method is totally not working
  def self.sign_in_omniauth(auth)
    # .tap allows a block
    # omniauth allows you to set the hash values by stringing them together with .
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.save!
    end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update(params, *options)
    else
      super
    end
  end

  def facebook_friends(user)
    # ff = HTTParty.get("https://graph.facebook.com/me?fields=id,name,friends&access_token=#{ENV['FACEBOOK_ACCESS_TOKEN']}")
    # FIXME throwing {"error":{"message":"An active access token must be used to query information about the current user.","type":"OAuthException","code":2500}}, oauth_token is nil and not eing saved
    # FIXME oauth_token, etc are still returning nil even after picking up the method from the documentation
    # FIXME for some reason def self.sign_in_omniauth(auth) is not picking up the user attributes from the hash
     ff = HTTParty.get("https://graph.facebook.com/me?fields=id,name,friends&access_token=#{user.oauth_token}")
  end
    # ff = HTTParty.get("https://graph.facebook.com/me?fields=id,name,friends&access_token=#{ENV['FACEBOOK_ACCESS_TOKEN']}CAAJZA7iSPUswBAD0ZAiFziYWWAZAZC1ZBhhOCAtdhWA8sHZAfD97Mdvi24KK8E8ZAmxgBdE4AQMqe6MQpraIVEoyoBZBNpWvA8VKEPn9RZCqIP7Bwxg6P3PV0JUAPXnO0NssLOiJB8R1NyotDexWi9N7n9Vn0X9dpW4YO17ZBkCVz8wGn4STUJt5jIiayeOplxG6Yr1si6vUgMrgZDZD")

# [7] pry(main)> user = User.find_by(id: 2)
#   User Load (0.6ms)  SELECT "users".* FROM "users" WHERE "users"."id" = 2 LIMIT 1
# => #<User id: 2, email: "a@example.com", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2014-04-10 01:29:22", last_sign_in_at: "2014-04-10 00:43:30", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", created_at: "2014-04-10 00:16:20", updated_at: "2014-04-10 01:29:22", avatar_file_name: "IMG_1463.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 59768, avatar_updated_at: "2014-04-10 00:30:38", provider: nil, uid: nil, oauth_token: nil>
# [8] pry(main)> user.auth_token

end
