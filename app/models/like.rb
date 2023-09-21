class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: "User"

  after_save :update_post_likes_counter
  after_destroy :update_post_likes_counter

  private

  def update_post_likes_counter
    post.update(liked_counter: post.likes.count)
  end
end
