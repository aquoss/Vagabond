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
    password_digest: 'a',
    current_city: 'San Francisco'
  }
end
user = User.create(user_data)

city_data = [{
    city_name: 'San Francisco',
    photo: "http://www.sftravel.com/sites/sftraveldev.prod.acquia-sites.com/files/SanFrancisco_0.jpg",
    gif: "https://media.giphy.com/media/vD7jNwCgUXBdu/giphy.gif"
  }, {
    city_name: "London",
    photo: "https://media.timeout.com/images/100644443/image.jpg",
    gif: "https://media.giphy.com/media/pYhFb0kn2GhQQ/giphy.gif"
  }, {
    city_name: "Gibraltar",
    photo: "http://www.officialrocktours.com/images/mob/gibraltar-aerial.jpg",
    gif: "https://media.giphy.com/media/12vbDdhxvStvWw/giphy.gif"
  }, {
    city_name: "Tokyo",
    photo: "http://vacationadvice101.com/wp-content/uploads/2013/04/Tokyo-Tower-and-Tokyo-Skyline-at-night.jpg",
    gif: "https://media.giphy.com/media/xTiTndRhkTeDSUEgak/giphy.gif"
  }, {
    city_name: "Hong Kong",
    photo: "https://www.sarahlawrence.edu/media/study-abroad-and-exchange/beijing/beijing_main_shutterstock_111796310.jpg",
    gif: "https://media.giphy.com/media/tGOKSq52jeq3u/source.gif"
  }, {
    city_name: "Sydney",
    photo: "http://www.allianceabroad.com/wp-content/uploads/sydney_harbour.jpg",
    gif: "https://media.giphy.com/media/aUmSzhzcR2p6E/giphy.gif"
  }, {
    city_name: "Paris",
    photo: "http://images.huffingtonpost.com/2015-11-19-1447968585-1661590-6672156239_89c77d53d8_o.jpg",
    gif: "https://media.giphy.com/media/vXEeRBP3QeJ2w/giphy.gif"
  }, {
    city_name: "Reykjavik",
    photo: "http://blog.radissonblu.com/wp-content/uploads/2015/04/Reykjavik-city.jpg",
    gif: "https://media.giphy.com/media/4EhFiUaNYyZZS/giphy.gif"
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

following = user[2..10]
followers = user[3..8]
following.each { |followed| user.first.follow(followed) }
followers.each { |follower| follower.follow(user.first) }
