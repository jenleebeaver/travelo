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

    #defining setter and getter method for location_name
    # def location_name=(name)
    #     self.location = Location.find_or_create_by(location_name: name)
    # end

    # def location_name
    #     self.location ? self.location.location_name : nil
    # end

    accepts_nested_attributes_for :location 
    def location_attributes=(attributes)
        location = Location.find_or_create_by(attributes)
        self.location = location if location.valid? || !self.vet
      end

    #   def users_attributes=(user_attributes)
    #     user_attributes.values.each do |user_attribute|
    #       if user_attribute["id"].present?
    #         user = User.find_or_create_by(user_attribute)
    #         self.users << user
    #       end
    #     end
    #   end
end
