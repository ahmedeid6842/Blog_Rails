require "rails_helper"

RSpec.describe PostsController, type: :request do
  describe "GET #index" do
    user = FactoryBot.create(:user, name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                    bio: "A genius Backend developer from Egypt.", posts_counter: 0)
    FactoryBot.create(:post, author: user, title: "Post1", liked_counter: 0, comments_counter: 0)
    FactoryBot.create(:post, author: user, title: "Post2", liked_counter: 0, comments_counter: 0)
    FactoryBot.create(:post, author: user, title: "Post3", liked_counter: 0, comments_counter: 0)

    it "returns a success response" do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it "includes correct placeholder text in the response body" do
      get "/users/#{user.id}/posts"
      expect(response.body).to include("Comments")
    end
  end

  describe "GET #show" do
    user = FactoryBot.create(:user, name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                    bio: "A genius Backend developer from Egypt.", posts_counter: 0)
    post = FactoryBot.create(:post, author: user, title: "Sample Title", liked_counter: 5, comments_counter: 1)

    it "returns a success response" do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it "includes correct placeholder text in the response body" do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include("Comments")
    end
  end
end
