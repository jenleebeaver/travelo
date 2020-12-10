class Location < ApplicationRecord

    has_many :posts
    has_many :users, through: :posts

    def user_attributes=(user_attributes)
      self.user = User.find_or_create_by(id: user_attributes[:id]) unless user_attributes[:id].blank?
    end

    def post_attributes=(post_attributes)
      self.post = Post.find_or_create_by(post_id: post_attributes[:user_id]) unless post_attributes[:user_id].blank?
    end

    #? SQL sanitizes data 
    scope :search_by_location_name, -> (search_location_name){where("location_name == ?", search_location_name)}
    
end
