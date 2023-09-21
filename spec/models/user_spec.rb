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
end
