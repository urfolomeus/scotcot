class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
      
    if user.is_owner?
      can :manage, Portfolio
    else
      can :read, :all
      cannot :read, Portfolio
    end
  end
end