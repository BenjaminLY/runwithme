class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
   is_user_participant?
  end

  private

  def is_user_participant?
    record.event.joined?(user)
  end
end
