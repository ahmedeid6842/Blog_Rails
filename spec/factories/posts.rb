# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    # Define the attributes for the Post model
    # Example:
    title { "Sample Title" }
    text { "sample text" }
    liked_counter { 5 }
    comments_counter { 1 }
    # You can associate the post with the user by defining the author association
    association :author, factory: :user
  end
end
