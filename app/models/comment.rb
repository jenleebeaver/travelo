class Comment < ApplicationRecord
    belongs_to :posts 
    has_many :posts
end
