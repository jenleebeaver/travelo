class Post < ApplicationRecord
    belongs_to :user 
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

end
