class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :read, [User, Menu]
      can :update, User
      can %i[create update], [Menu, MenuItem]
      can :index, Order
    else
      can %i[show update create], User
      can :read, [Menu, MenuItem]
      can %i[new create], Order
    end
  end
end
