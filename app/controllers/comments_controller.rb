class CommentsController < ApplicationController
  before_action :set_ad

  def create
    comment = @ad.comments.create! comments_params
    CommentsChannel.broadcast(comment)
    redirect_to @ad
  end

  private

  def set_ad
    @ad = Ad.find(params[:ad_id])
  end

  def comments_params
    params.require(:comment).permit(:body, :user_id)
  end
end
