class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    user == current_user ||
     !user.private? || 
     user.followers.include?(current_user)
  end

  def liked?
    user == current_user ||
     !user.private? || 
     user.followers.include?(current_user)
  end

  def feed?
    user == current_user ||
     !user.private? || 
     user.followers.include?(current_user)
  end

end