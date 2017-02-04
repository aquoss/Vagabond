class Relationship < ApplicationRecord
  # similar to user model, need to specify the class_name because both follower and followed are in the relationships table, not their own separate tables
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # checks that the user exists to make the relationship
  validates :follower_id, presence: true
  validates :followed_id, presence: true

end
