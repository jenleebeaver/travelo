class User < ApplicationRecord
    #password validations
    has_secure_password
    has_many :posts
    has_many :locations, through: :posts
    has_many :comments

    validates :full_name, length: {minimum: 2, message: "Name must be longer than two characters."}, presence: true
    validates :username, length: {minimum: 3}, uniqueness: true, presence: true
    validates :password, length: {in: 6..20, message: "Password must be between 6 and 20 characters."} 
    validates :email, uniqueness: true, presence: true
    # validates :not_a_robot, acceptance :true, presence: { message: "Human's only!"}

end
