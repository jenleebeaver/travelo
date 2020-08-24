class User < ApplicationRecord
    has_secure_password
    has_many :locations, :class_name => "Location"
    has_many :posts
    has_many :comments, through: :posts

    validates :name, length: {minimum: 2, maximum: 9}
    validates :username, length: {minimum: 3, maximum: 9}, uniqueness: true
    validates :password, length: {in: 6..20}
    validates :email, uniqueness: true
    # validates :not_a_robot, acceptance :true, presence: { message: "Human's only!"}

end
