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
4.times do
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
  }
]
city = City.create(city_data)

post_data = [{
    title: 'Best city ever!',
    content: 'The food was great.  The weather was great.  Can not wait to return!',
    user: user.sample,
    city: city.sample
  }, {
    title: 'Wonderful food!',
    content: 'I feel like I ate my way across the whole city and it was fantastic!
    If you visit, make sure you try The Plant in in the financial district.',
    user: user.sample,
    city: city.sample
  }, {
    title: 'Interesting people',
    content: 'I had a great time exploring the parks in the city.  There were
    many festivals and the locals were very kind.',
    user: user.sample,
    city: city.sample
  }
]
post = Post.create(post_data)

comment_data = [{
  user: user.sample,
  content: 'I agree'
  }, {
    user: user.sample,
    content: "I really liked eating at a scottish eatery called McDonald's."
  }, {
    user: user.sample,
    content: "Having a bit of a faff I took a dekko and found a right great nosh.
    Stonking good idea, hitting up a random pub."
  }
]
comment = Comment.create(comment_data)
