class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments

  # need to specify the foreign_key because otherwise rails will look for a table called "active_relationships" (relationships table has both active and passive relationships)
  # 'dependent: :destroy' deletes a user's relationships when a user is deleted
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  ## rails defaults followed to followeds, so overwrite with following
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  mount_uploader :photo, PhotoUploader

  validates :email, uniqueness: {message: " is already taken! Log into your existing account or choose a different address."}
  validates_presence_of :email, :password_digest, :first_name, :last_name

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password_digest]) : false
  end

  # follows a user
  def follow(other_user)
    following << other_user
  end

  # unfollows a user
  def unfollow(other_user)
    following.delete(other_user)
  end

  # checks if users are following each other
  def following?(other_user)
    following.include?(other_user)
  end

end
