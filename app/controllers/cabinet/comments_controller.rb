class Cabinet::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @comments = if current_user.user?
                  Comment.where(user_id: current_user.id)
                else
                  Comment.all
                end
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to cabinet_comments_url, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_comments_url, notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
