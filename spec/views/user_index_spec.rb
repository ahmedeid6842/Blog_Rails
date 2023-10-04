require "rails_helper"

RSpec.describe "User index page", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user, name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                     bio: "A genius Backend developer from Egypt.", posts_counter: 0)
    @user2 = FactoryBot.create(:user, name: "mohamed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                      bio: "A genius Full stack developer from Egypt.", posts_counter: 0)
    visit "/users"
  end

  it "displays the username of all other users" do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  it "displays the profile picture for each user" do
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end

  it "displays the number of posts each user has written" do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it "redirects to the user show page when clicking on a user" do
    users = all(".flex-grow-1")
    users[users.length - 1].click

    user = User.find_by(id: page.current_path.split("/").last)

    expect(page).to have_current_path(user_path(user))
  end
end
