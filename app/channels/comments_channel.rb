class CommentsChannel < ApplicationCable::Channel
  def self.broadcast(comment)
    broadcast_to comment.ad, comment:
      CommentsController.render(partial: 'comments/comment', locals: { comment: comment })
  end

  def subscribed
    #stream_for Ad.find(params[:ad_id])
    stream_for Ad.find(params[:ad_id])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

