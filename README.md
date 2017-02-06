# Postcards
A community for travelers to gather and share stories of their adventures.
Looking for your next escape idea?  Postcards has you covered!

## Contributors:
- Alex
- Amber
- LD
- Mike

## Code We're Proud of:
### Alex
Creates the vertical rule effect.
```CSS
.vr {
  border-right: 5px solid black;
  height: 450px;
  margin: 25px -13px 0 0;
}
```

```HTML
<div class="row">
  <div class="col m12 postcard-border animated rollIn">
    <div class="row">
      <div class="col m6 text-welcome">
        <div class="vr animated rollIn">

        </div>
      </div>
      <div class="col m6 address">
        <div class="stamp animated rollIn">
        </div>
        <br><br><br><br><br><br><br>
        <p>A community for travelers to gather</p>
        <hr>
        <p>and share stories of their adventures.</p>
        <hr>
        <p>Looking for your next escapade idea?</p>
        <hr>
        <p>Postcard has you covered!</p>
        <hr>
      </div>
    </div>
  </div>
```

### Amber
Sets up two way relationships between users

```Ruby
class User < ApplicationRecord

	...

  # need to specify the foreign_key because otherwise rails will look for a table called "active_relationships" (relationships table has both active and passive relationships)
  # 'dependent: :destroy' deletes a user's relationships when a user is deleted
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
```
```HTML
<%= form_for (current_user.active_relationships.build) do |f| %>
<!-- need the hidden field to send the user id as input to the controller -->
  <div><%= hidden_field_tag :followed_id, @user.id %></div>
  <%= f.submit "Follow my journey", class: "btn" %>
<% end %>
```

### LD
This code is in the app/mailers/user_mailer.rb file and sets up the method for embedding ruby data in the view that handles the welcome email that gets sent out. The view itself isn't on the website but allows ActionMailer to use it as a template for sending out both html and text versions of the email, depending on the user's preference.
```Ruby
class UserMailer < ApplicationMailer

  default from: 'notifications@postcard-wdi34.herokuapp.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://postcard-wdi34.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Vagabond!')
  end

end
```

### Mike
I'm proud of setting up the basic foundation for most of sprint 2.  The final/provided status involved all
of my teammates but I was able to accomplish much of this sprint (controller and view creation) which
helped me to feel better about the material we're learning.
```Ruby
def update
  @city = City.find_by_id(params[:city_id])
  post = Post.find_by_id(params[:id])
  if post.update(post_params)
    redirect_to city_post_path(@city, post)
  else
    flash[:error] = post.errors.full_messages.join(". ")
    redirect_to edit_city_post_path(@city, post)
  end
end
```
``` HTML
<div class="content col m12">
  <h3 class="post-title"><%= @post.title %></h3>
  <hr>
  <%= @post.content %>
</div>
<div class="vr">
</div>
</div>
<div class="col m6 address">
<% if @post.user == current_user %>
  <div class="stamp">
    <%= link_to city_post_path(@post.city.id, @post.id), action: "destroy", class: "stamp-link" do%>
      <p><span class="make-small"> Delete</span> <br> Post </p>
    <% end %>
  </div>
  <div class="stamp">
    <%= link_to edit_city_post_path(@post.city.id, @post.id), class: "stamp-link" do%>
    <p> Edit <br> Post </p>
    <% end %>
  </div>
<% else %>
  <div class="stamp">
  </div>
  <div class="stamp">
  </div>
<% end %>
<div class="post">
  <p>
    <h5>by <%= link_to "#{@post.user.first_name} #{@post.user.last_name}", user_path(@post.user) %></h5>
    <hr>
    <h5>in <%= link_to "#{@post.city.city_name}", city_path(@post.city.id) %></h5>
    <hr>
  </p>
</div>
```

## ERD:
![Vagabond ERD](http://imgur.com/a/HeftV)

## Technologies used:
- Ruby
- Rails
- HTML
- CSS
- jquery
- Materialize
- animate.css
- Postgresql
- SASS
- Bcrypt
- Carrierwave
- Figaro
- Rails-erd
- Better errors

## Table Structures:
User
- email
- password_digest
- first_name
- last_name
- current_city
- prof_photo (add using CarrierWave)
* has_many posts

City
- city_name (SF, London, Gibraltar, ...)
- photo
* has_many posts

Post
- title
- content
* belongs_to city
* belongs_to user

Friends
- content
* belongs_to post
* belongs_to user

## Next Steps:
- Change color palette.
- Fix typo on landing page making postcards plural in Postcards has you covered!
- Remove grey 3D effect from the nav bar which looks more like a grey line than a 3D effect.
- City show page should make it easier to tell that the title and the name are both links.
- City show page should have city text that fits within the boundries of the image.
- User show page should show who is being followed in addition to who is following this person.
- Post show page can include the image of the user who wrote the post.
- Post edit page should have a cancel button.
- Post creation page and post edit page should both show the name of the city the post is being written/changed for.
- Post show page should tell a user to login to write a post.
- Post show page should have a nicer looking edit/delete option instead of the black text over the stamps.
- Post show page should have center aligned content.
- Hero images for each city in seed data should be images that are better sized for taking a piece from the upper left section allowing the image to look better when used.
- We should pick a new SF gif.
- Chat should be an option with friends.
- Get UX feedback and implement.
- Create account page there isn't as much space between the top of the border and the first line as there is between each other line.
- News feed to inform you of recent posts from people you're following.
