require "rails_helper"

describe "Viewing show user page", type: :feature do
  describe "User show page" do
    before(:each) do
      @user = FactoryBot.create(:user, name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                       bio: "A genius Backend developer from Egypt.", posts_counter: 0)
      @post1 = FactoryBot.create(:post, author: @user, title: "Sample Title1", liked_counter: 0, comments_counter: 0)
      @post2 = FactoryBot.create(:post, author: @user, title: "Sample Title2", liked_counter: 0, comments_counter: 0)
      @post3 = FactoryBot.create(:post, author: @user, title: "Sample Title3", liked_counter: 0, comments_counter: 0)

      visit user_path(@user)
    end

    it 'displays the user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it 'displays the user\'s username' do
      expect(page).to have_content(@user.name)
    end

    it "displays the number of posts the user has written" do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it 'displays the user\'s bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'displays the user\'s first 3 posts' do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end

    it 'displays a button to view all of a user\'s posts' do
      expect(page).to have_link "See All Posts"
    end

    it 'redirects to a user\'s post show page when clicking on a post' do
      click_link("Sample Title1")
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end

    it 'redirects to a user\'s post index page when clicking to see all posts' do
      click_link("See All Posts")
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
