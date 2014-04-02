class User < ActiveRecord::Base

  has_secure_password

  has_many :giftlists

  has_many :relationships, foreign_key: "friend_id", dependent: :destroy
  has_many :friends, through: :relationships, source: :friend
  has_many :reverse_relationships, foreign_key: "other_friend_id", class_name: "Relationship", dependent: :destroy
  has_many :other_friends, through: :reverse_relationships

  def add_friend(other_user)
    self.relationships.create(other_friend_id: other_user.id)
  end

  def remove_friend(other_user)
    self.relationships.find_by(other_friend_id: other_user.id).destroy
  end

end
