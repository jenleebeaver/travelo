class Location < ApplicationRecord
    has_many :posts 
    has_many :users, through: :posts
    accepts_nested_attributes_for :users, :posts

    def user_attributes=(user_attributes)
      self.user = User.find_or_create_by(email: user_attributes[:email]) unless user_attributes[:email].blank?
    end
end
