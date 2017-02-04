# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
User.destroy_all
Post.destroy_all
Comment.destroy_all

user_data = []
15.times do
  first = FFaker::Name.first_name
  last = FFaker::Name.last_name
  user_data << {
    first_name: first,
    last_name: last,
    email: "#{first[0]}_#{last}@example.com".downcase,
    password: 'a',
    current_city: 'San Francisco'
  }
end
user = User.create(user_data)

city_data = [{
    city_name: 'San Francisco',
    photo: "http://www.sftravel.com/sites/sftraveldev.prod.acquia-sites.com/files/SanFrancisco_0.jpg"
  }, {
    city_name: "London",
    photo: "https://media.timeout.com/images/100644443/image.jpg"
  }, {
    city_name: "Gibraltar",
    photo: "http://www.officialrocktours.com/images/mob/gibraltar-aerial.jpg"
  }, {
    city_name: "Tokyo",
    photo: "http://vacationadvice101.com/wp-content/uploads/2013/04/Tokyo-Tower-and-Tokyo-Skyline-at-night.jpg"
  }, {
    city_name: "Beijing",
    photo: "https://www.sarahlawrence.edu/media/study-abroad-and-exchange/beijing/beijing_main_shutterstock_111796310.jpg"
  }, {
    city_name: "Sydney",
    photo: "http://www.allianceabroad.com/wp-content/uploads/sydney_harbour.jpg"
  }, {
    city_name: "Paris",
    photo: "http://images.huffingtonpost.com/2015-11-19-1447968585-1661590-6672156239_89c77d53d8_o.jpg"
  }, {
    city_name: "Reykavik",
    photo: "http://blog.radissonblu.com/wp-content/uploads/2015/04/Reykjavik-city.jpg"
  }
]
city = City.create(city_data)

post_data = []
30.times do
  title = FFaker::Book.title
  content = FFaker::HipsterIpsum.paragraph
  post_data << {
    title: title,
    content: content,
    user: user.sample,
    city: city.sample
  }
end
post = Post.create(post_data)

# comment_data = [{
#   user: user.sample,
#   content: 'I agree'
#   }, {
#     user: user.sample,
#     content: "I really liked eating at a scottish eatery called McDonald's."
#   }, {
#     user: user.sample,
#     content: "Having a bit of a faff I took a dekko and found a right great nosh.
#     Stonking good idea, hitting up a random pub."
#   }
# ]
# comment = Comment.create(comment_data)

following = user[2..10]
followers = user[3..8]
following.each { |followed| user.first.follow(followed) }
followers.each { |follower| follower.follow(user.first) }

