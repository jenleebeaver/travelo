class Location < ApplicationRecord
    has_many :posts #user_id
    has_many :users, through: :posts
end
