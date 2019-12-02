class WatchlistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end
  def create?
    user
  end

  def destroy?
    record.user == user
  end

  def update?
    destroy?
  end

  def edit?
    update?
  end
end
