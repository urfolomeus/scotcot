class Ability
  include CanCan::Ability
  
  def initialize(user)
    if user.nil?
      can :read, :all
    elsif user.is_owner?
      can :manage, @portfolio
    end
  end
end