class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password_digest)
    # confirm that email/password combination is correct
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "You're Successfully logged in!"
      redirect_to @user
    else
      flash[:error] = "Hmm... that's the incorrect email or password."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "You're successfully logged out!"
    redirect_to root_path
  end

end
