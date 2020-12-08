class Post < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    #add optional: true when first instantiating without location data
    #belongs_to should give us access to post.user and post.location 
    belongs_to :location
    has_many :comments
    accepts_nested_attributes_for :location, :user
    #not sure if we have to accepts_nested_attributes_for :user? 

    validates :content, length: {minimum: 50, maximum: 1000},  presence: true
    validates :location_id, presence: true
    validates_associated :location
    validates :not_a_robot, acceptance: { message: "Humans only!" }

    accepts_nested_attributes_for :location 
    def location_attributes=(attributes)
        location = Location.find_or_create_by(attributes)
        self.location = location if location.valid? || !self.location
      end

end
