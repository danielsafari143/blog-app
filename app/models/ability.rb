class Ability
  include CanCan::Ability

  def initialize(user)
    can :delete, Post, author: user
    can :delete, Comment, author: user
    can :delete, Post if user.role == 'admin'
    can :delete, Comment if user.role == 'admin'
  end
end
