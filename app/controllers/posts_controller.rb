class PostsController < ApplicationController

  before_action :require_login, only: [:create, :update, :destroy]

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
        redirect_to city_post_path
      else
        redirect_to new_city_post_path
      end
  end

  private

  def post_params
    params.require(:user).permit(:title, :content)
  end


end
