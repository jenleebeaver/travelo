class Post < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    #add optional: true when first instantiating without location data
    belongs_to :location
    has_many :comments
    accepts_nested_attributes_for :location

    validates :content, length: {minimum: 50, maximum: 1000},  presence: true
    validates :location_name, presence: true
    validates :not_a_robot, acceptance: { message: "Humans only!" }

    #defining setter and getter method for location_name
    def location_name=(name)
        self.location = Location.find_or_create_by(location_name: name)
    end

    def location_name
        self.location ? self.location.location_name : nil
    end

    # def locations_attributes=(location_attributes)
    #     location_attributes.values.each do |location_attribute|
    #       if location_attribute["location_name"].present?
    #         location = Location.find_or_create_by(location_attribute)
    #         self.locations << location
    #       end
    #     end
    #   end
end
