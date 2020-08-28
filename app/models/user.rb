class User < ApplicationRecord
    #password validations
    has_secure_password
    has_many :posts
    has_many :locations, through: :posts
    has_many :comments, through: :posts

    validates :full_name, length: {minimum: 2}, presence: true
    validates :username, length: {minimum: 3}, uniqueness: true, presence: true
    validates :password, length: {in: 6..20} 
    validates :email, uniqueness: true, presence: true
    # validates :not_a_robot, acceptance :true, presence: { message: "Human's only!"}

end
