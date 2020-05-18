# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin? || user.moderator?
      can :manage, :all
    end

    if user.user?
      can :manage, User.where(id: user.id)
      can %i[index new create], Ad
      can :manage, Ad.where(user_id: user.id)
    end
  end
end
