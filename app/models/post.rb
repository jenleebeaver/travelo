class Post < ApplicationRecord
    belongs_to :user
    #add optional: true when first instantiating without location data
    belongs_to :location, optional: true 

    validates :content, length: {minimum: 50, maximum: 1000},  presence: true
    validates :location_name, presence: true
    validates :not_a_robot, acceptance: { message: "Humans only!" }
end
