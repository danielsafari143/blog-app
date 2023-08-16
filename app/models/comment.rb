class Comment < ApplicationRecord
    has_many :likes
    has_one :user
end