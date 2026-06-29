class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @reply = Reply.new
    @replies = @post.replies.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to posts_path, notice: "削除しました"
  end

  private

  def require_login
    unless current_user
      redirect_to login_path, alert: "ログインしてください"
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
