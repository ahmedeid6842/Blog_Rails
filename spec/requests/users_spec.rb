require "rails_helper"

RSpec.describe UsersController, type: :request do
  describe "GET #index" do
    it "returns a success response" do
      get "/users"
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get "/users"
      expect(response).to render_template(:index)
    end

    it "includes correct placeholder text in the response body" do
      get "/users"
      expect(response.body).to include("Users")
    end
  end

  describe "GET #show" do
    user = FactoryBot.create(:user, name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                    bio: "A genius Backend developer from Egypt.", posts_counter: 0)
    it "returns a success response" do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it "includes correct placeholder text in the response body" do
      get "/users/#{user.id}"
      expect(response.body).to include("See All Posts")
    end
  end
end
