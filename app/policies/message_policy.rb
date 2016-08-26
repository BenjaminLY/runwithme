class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
   true
  end

  private

  def is_user_participant?
    record.user == user
  end
end
