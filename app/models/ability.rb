class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if (user.role = 'admin')
      can :manage, Expenditure, author_id: author.id
      can :manage, Category, author_id: author.id
    else
      can :read, :all
    end
  end
end
