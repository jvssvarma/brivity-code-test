class CommentPolicy < ApplicationPolicy
  def destroy?
    return true if record.user_id == user.id
  end
end
