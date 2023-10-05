class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == "admin"
      can :destroy, Post
    else
      can :destroy, Post, user_id: user.id
    end
  end
end