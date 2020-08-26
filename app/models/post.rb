class Post < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :content, length: {minimum: 50, maximum: 200},  presence: true
    validates :not_a_robot, acceptance: { message: "Humans only!" }
end
