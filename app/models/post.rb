class Post < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :comments

  validates :title, length: { in: 1..200, message: " must be between 1 and 200 characters"}
  validates :content, presence: {message: " can't be blank. Spice up your review!"}

end
