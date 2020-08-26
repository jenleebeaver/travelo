class User < ApplicationRecord
    has_secure_password
    has_many :locations, :class_name => "Location"
    has_many :posts
    has_many :comments, through: :posts

    validates :full_name, length: {minimum: 2}, presence: true
    validates :username, length: {minimum: 3}, uniqueness: true, presence: true
    validates :password, length: {in: 6..20}, presence: true
    validates :email, uniqueness: true, presence: true
    # validates :not_a_robot, acceptance :true, presence: { message: "Human's only!"}
    validates :location, presence: true

end
