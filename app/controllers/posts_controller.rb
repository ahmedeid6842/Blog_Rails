class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params.merge(liked_counter: 0, comments_counter: 0))
    if @post.save
      redirect_to user_post_path(@post.author, @post)
    else
      flash.now[:alert] = "Post creation failed!"
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    authorize! :destroy, @post

    if @post.destroy
      redirect_to user_posts_path(@post.author), notice: "Post deleted successfully."
    else
      flash[:alert] = "You are not authorized to delete that post."
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :liked_counter, :comments_counter)
  end
end
