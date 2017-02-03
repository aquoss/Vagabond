class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments

  mount_uploader :photo, PhotoUploader

  validates :email, uniqueness: {message: " is already taken! Log into your existing account or choose a different address."}
  validates_presence_of :email, :password, :first_name, :last_name

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
