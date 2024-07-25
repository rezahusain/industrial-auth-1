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
    user == comment.author
  end


  def destroy?
    user == comment.author
  end

  def create?
    true
  end

  def index?
    true
  end

end
