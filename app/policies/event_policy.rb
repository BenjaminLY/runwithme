class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    if record.joined?(user) || record.private == false
  	   true
    else
      false
    end
  end
  def create?
    true # tout le monde peut créer un event
  end

  def update?
    # true si le current_user a créé le restau
    # current_user => user
    # record
    is_user_organizer?
  end

  def destroy?
     is_user_organizer?
  end

  private

  def is_user_organizer?
    record.user == user 
  end 
end
