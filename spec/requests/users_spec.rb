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
      expect(response.body).to include("List of Users")
    end
  end
end
