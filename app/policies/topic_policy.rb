class TopicPolicy < ApplicationPolicy
  
  def index?
    true
  end
  
  def create?
    user.present? 
  end
  
  def update?
    create?
  end
  
  def destroy?
    create?
  end
  
  def show?
    record.public? || user.present?
  end
  
end