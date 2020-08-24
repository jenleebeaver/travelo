class Location < ApplicationRecord
    belongs_to :users, through: :posts #user_id
end
