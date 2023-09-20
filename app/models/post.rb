class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :comments

  after_create :update_user_posts_counter

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
