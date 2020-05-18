class HomeController < ApplicationController
  def index
    @ads = Ad.order(updated_at: :desc)
    @users = User.order(updated_at: :desc)
  end
end
