class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.new(reply_params)
    @reply.user = current_user

    if @reply.save
      redirect_to post_path(@post)
    else
      @replies = @post.replies
      render "posts/show" , status: :unprocessable_entity
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
