class PostPolicy < ApplicationPolicy
  def update?
    return true if record.user_id == user.id
  end

  def destroy?
    return true if record.user_id == user.id
  end
end
