class WelcomeController < ApplicationController

  def index
    @city = City.all

  end

end
