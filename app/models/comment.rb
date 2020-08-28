class Comment < ApplicationRecord
    belongs_to :post
    accepts_nested_attributes_for :user

  def user_attributes=(user_attributes)
    self.user = User.find_or_create_by(email: user_attributes[:email]) unless user_attributes[:email].blank?
  end
end
