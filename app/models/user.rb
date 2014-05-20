class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, :styles => {
    :medium => "300x300>",
    :thumb => "100x100>" },
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :giftlists
  has_many :gifts

# TODO this is fine now, but decide what other attributes you need to get from facebook and add them to the database
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
      # user profile picture
      # user username
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
    # FIXME for some reason def self.sign_in_omniauth(auth) is not picking up the user attributes from the hash -- oauth token is not being saved in the database (returns nil in rails c) although the messy friends hash is being returned
     ff = HTTParty.get("https://graph.facebook.com/me?fields=id,name,friends&access_token=#{user.oauth_token}")
  end

end
