class Relationship < ActiveRecord::Base
  belongs_to :friend, class_name: "User"
  belongs_to :other_friend, class_name: "User"
end
