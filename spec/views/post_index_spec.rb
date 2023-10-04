require "rails_helper"

describe "Posts index page", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user, name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                     bio: "A genius Backend developer from Egypt.", posts_counter: 0)
    @post = FactoryBot.create(:post, author: @user, title: "Sample Title1", text: "this is my text", liked_counter: 0,
                                     comments_counter: 0)
    FactoryBot.create(:comment, author: @user, post: @post, text: "Comments")
    FactoryBot.create(:comment, author: @user, post: @post, text: "Comment 2")
    visit user_posts_path(@user)
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

  it 'displays a post\'s title' do
    expect(page).to have_content(@post.title)
  end

  it 'displays some of the post\'s body' do
    expect(page).to have_content(@post.text)
  end

  it "displays the first comments on a post" do
    expect(page).to have_content("Comments")
  end

  it "displays the number of comments a post has" do
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end

  it "displays the number of likes a post has" do
    expect(page).to have_content("Likes: #{@post.liked_counter}")
  end

  it "displays a section for pagination if there are more posts than fit on the view" do
    expect(page).to have_button("Pagination")
  end

  it 'redirects to a post\'s show page when clicking on a post' do
    click_link("Sample Title1")
    expect(page).to have_current_path(user_post_path(@user, @post))
  end
end
