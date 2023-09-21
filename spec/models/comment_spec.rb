require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "update_post_comments_counter" do
    it "should  the post's comments_counter Intially 0" do
      user = User.create(name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                         bio: "A genius Backend developer from Egypt.")
      post = Post.create(author: user, title: "post", liked_counter: 4, comments_counter: 0)
      Comment.create(post: post)

      expect(post.comments_counter).to eq(0)
    end
  end
end
