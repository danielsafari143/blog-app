class Comment < ApplicationRecord
    has_many :likes
    belongs_to :users
end