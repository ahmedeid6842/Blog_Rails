class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    puts current_user.likes
    @like = current_user.likes.new
    @like.post_id = params[:post_id]
    if @like.save
      redirect_to user_post_path(current_user.id, params[:post_id])
    else
      render :create
    end
  end
end
