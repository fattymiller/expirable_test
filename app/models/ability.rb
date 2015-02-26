class Ability
  include CanCan::Ability

  def initialize(user)
    can :index, User, invited_applications: { owner_company: { company_users: { acl: ["admin", "application_manager"], user_id: user.id }}}
  end
end
