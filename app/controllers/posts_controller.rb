class PostsController < ApplicationController

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
    @city = City.find_by_id(params[:city_id])
  end

  def create
    post = Post.new(post_params)
      if post.save
        current_user.posts << post
        redirect_to post_path
      else
        redirect_to new_post_path
      end
  end

  private

  def post_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
