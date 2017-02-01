class PostsController < ApplicationController
<<<<<<< HEAD
  def show
  end
=======

  def show
    @post = Post.find_by_id(params[:id])
  end

>>>>>>> d86b61c58545f65771af599766e4ee549318c171
end
