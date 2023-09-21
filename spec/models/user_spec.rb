require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it "should validate presence of name" do
      user = User.create(name: " ", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.")
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "should validate numericality of posts_counter" do
      user = User.new(posts_counter: -1)
      expect(user).not_to be_valid
      expect(user.errors[:posts_counter]).to include("must be greater than or equal to 0")

      user_valid = User.new(name: "ahmed", posts_counter: 10)
      expect(user_valid).to be_valid
    end
  end

  describe "recent_posts" do
    it "should return the most recent 3 posts" do
      user = User.create(name: "ahmed eid", posts_counter: 0)
      (1..6).each do |n|
        user.posts.create(title: "Post #{n}", text: "Content", created_at: n.days.ago)
      end

      expect(user.recent_posts).to eq(user.posts.order(created_at: :desc).limit(3))
    end
  end
end
