class PostsController < ApplicationController

  before_action :require_login, only: [:create, :update, :destroy]

  def show
    @city = City.find_by_id(params[:city_id])
    @post = Post.find_by_id(params[:id])
  end


  def new
    @post = Post.new
    @city = City.find_by_id(params[:city_id])
  end

  def edit
    @city = City.find_by_id(params[:city_id])
    @post = Post.find_by_id(params[:id])
  end

  def create
    @city = City.find_by_id(params[:city_id])
    post = Post.new(post_params)
      if post.save
        current_user.posts << post
        @city.posts << post
        redirect_to city_post_path(@city, post)
      else
        redirect_to new_city_post_path
      end
  end

  def update
    @city = City.find_by_id(params[:city_id])
    post = Post.find_by_id(params[:id])
    if post.update(post_params)
      redirect_to city_post_path(@city, post)
    else
      redirect_to exit_city_post_path(@city, post)
    end
  end

  def destroy
    @city = City.find_by_id(params[:city_id])
    post = Post.find_by_id(params[:id])
    post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end


end
