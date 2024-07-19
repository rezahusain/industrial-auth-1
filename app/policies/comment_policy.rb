class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def show?
    user == @comment.owner ||
    !comment.owner.private? ||
    comment.owner.followers.include?(user)
  end

  def edit?
    user == comment.owner
  end

  def destroy?
    user == comment.owner
  end

  def update? 
    user == comment.owner
  end

  def create?
    user == comment.owner
  end

  def new?
    user == comment.owner
  end

end
