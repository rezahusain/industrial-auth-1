class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    true
  end

  def liked?
    current_user == @user ||
    !user.private? ||
    user.followers.include?(current_user)
  end

  def feed?
    current_user == @user
  end

  def discover?
    current_user == @user
  end

  def content?
    current_user == @user ||
    !user.private? ||
    user.followers.include?(current_user)
  end

end
