class Post < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :comments

  validates :title, length: { in: 1..200, message: " isn't quite the right length. It must be between 1 and 200 characters"}
  validates :content, presence: {message: " error: I think you are missing some details in your review. Add more info!"}

end
