class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def show?
    user == @photo.owner ||
    !photo.owner.private? ||
    photo.owner.followers.include?(user)
  end

  def edit?
    true
  end

  def destroy?
    true
  end

  def update? 
    true
  end

  def create?
    true
  end

  def new?
    true
  end

end
