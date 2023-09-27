# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    # Define the attributes for the User model
    # Example:
    name { "Ahmed Eid" }
    photo { "https://unsplash.com/photos/F_-0BxGuVvo" }
    bio { "Backend developer from Egypt" }
  end
end
