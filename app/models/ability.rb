class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Post
    if !user.id.nil?

      if user.username=="tester"
        puts 'yes'
        can :manage, Post
      end
    else

    end
    puts user.username

  end
end
