class UserController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @ads = Ad.where(user_id: params[:id])
  end
end
