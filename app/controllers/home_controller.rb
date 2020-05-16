class HomeController < ApplicationController
  def index
    @ads = Ad.all
    @users = User.all
  end
end
