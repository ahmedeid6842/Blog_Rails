require "rails_helper"

describe "Posts show page", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user, name: "ahmed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                     bio: "A genius Backend developer from Egypt.", posts_counter: 0)
    @user2 = FactoryBot.create(:user, name: "mohamed", photo: "https://unsplash.com/photos/F_-0BxGuVvo",
                                      bio: "A genius Full stack developer from Egypt.", posts_counter: 0)
    @post = FactoryBot.create(:post, author: @user, title: "Sample Title1", text: "this is my text", liked_counter: 0,
                                     comments_counter: 0)
    FactoryBot.create(:comment, author: @user2, post: @post, text: "Comment 1")
    FactoryBot.create(:comment, author: @user2, post: @post, text: "Comment 2")

    visit user_post_path(@user, @post)
  end

  it 'displays the post\'s title' do
    expect(page).to have_content(@post.title)
  end

  it "displays who wrote the post" do
    expect(page).to have_content("by #{@user.name}")
  end

  it "displays how many comments the post has" do
    expect(page).to have_content("Comments: 2")
  end

  it "displays how many likes the post has" do
    expect(page).to have_css(".badge.bg-secondary.p-2", text: "0")
  end

  it "displays the post body" do
    expect(page).to have_content("Sample Title1")
  end

  it "displays the username of each commenter" do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  it "displays the comment each commenter left" do
    expect(page).to have_content("Comment 1")
    expect(page).to have_content("Comment 2")
  end
end
