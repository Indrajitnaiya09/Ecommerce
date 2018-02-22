class Ability
  include CanCan::Ability

=begin
    :create = new, create
    :read = index, show
    :update = edit, update
    :destroy = destroy 
    :manage = index, new, create, show, edit, update, destroy 
=end

  def initialize(user)
    if user.nil?
        can :read, [Category, Product]
    elsif user.role? "admin"      #roles.pluck(:name).include? "admin"
        can :manage, [Category, Product, Review]
    elsif user.role? "moderator"
        can :read, [Category, Product, Review]
        can :create, Review
        can :update, [Category, Product]
        can :destroy, Review
            
    elsif user.role? "customer"
        can :read, [Category, Product]
        can [:create, :read], Review
        can [:update, :destroy], Review do |review|
            review.user_id == user.id
        end
    end       
  end

  
end
