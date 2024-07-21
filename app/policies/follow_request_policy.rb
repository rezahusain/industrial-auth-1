class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user == follow_request.sender
  end

  def destroy?
    user == follow_request.sender
  end

  def set_follow_request
    user != follow_request.recipient
  end
end
