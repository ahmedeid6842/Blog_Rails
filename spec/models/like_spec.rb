require "rails_helper"

RSpec.describe Like, type: :model do
  describe "update_post_likes_counter" do
    it "should the post's liked_counter qual 0 intially" do
      user = User.create(name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                         bio: "A genius Backend developer from Egypt.")
      post = Post.create(author: user, title: "post", liked_counter: 0, comments_counter: 4)

      expect(post.liked_counter).to eq(0)
    end
  end
end
