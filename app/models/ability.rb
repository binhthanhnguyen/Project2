class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end

    if user.role? :student
        can :read, :all
        cannot :read, InternshipRegistration
        can [:create, :destroy], InternshipRegistration
        can [:create, :update], CurriculumVitae
    end
    # can :access, :rails_admin


    if user.role? :admin
        can :manage, :all
        cannot [:create], InternshipRegistration
        cannot [:create, :update], InternshipRecruitment
        cannot [:create, :update, :destroy], CurriculumVitae
    end

    if user.role? :company_representative
        can :manage, InternshipRecruitment
        cannot :create, InternshipRegistration
    end

    if user.role? :lecturer
        can :manage, InternshipRegistration
        cannot :create, InternshipRegistration
        can :read, InternshipRecruitment
        can :read, CurriculumVitae
        can :read, User
    end

    if user.role? :supervisor
        can :manage, InternshipRecruitment
        cannot :create, InternshipRecruitment
        can :manage, InternshipRegistration
        cannot :create, InternshipRegistration

    end
   
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
