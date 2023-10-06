module Api
  class CommentsController < ApplicationController
    def index
      post = Post.find(params[:post_id])
      comments = post.comments

      render json: comments
    end

    def create
      @post = Post.find(params[:post_id])
      comment = @post.comments.build(comment_params)
      comment.author = @post.author

      if comment.save
        render json: comment, status: :created
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
