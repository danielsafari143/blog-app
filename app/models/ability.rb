class Ability
  include CanCan::Ability

  def initialize(user)
    can :delete, Post, author: user
    can :delete, Post if user.role == 'admin'

    can :delete, Comment, author: user
    return unless user.role == 'admin'

    can :delete, Post
  end
end
