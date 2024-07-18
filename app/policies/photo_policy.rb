class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def show?
    owner_check ||
    !photo.owner.private? ||
    photo.owner.followers.include?(user)
  end

  def edit?
    owner_check
  end

  def destroy?
    owner_check
  end

  def update? 
    owner_check
  end

  def create?
    owner_check
  end

  def new?
    owner_check
  end

  private

  def owner_check
    user == photo.owner
  end
end
