class PostsController < ApplicationController

  before_action :require_login, only: [:create, :update, :destroy]

  def show
    @post = Post.find_by_id(params[:id])
  end

end
