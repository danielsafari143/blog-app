class Likes < ApplicationRecord
    belongs_to :users
    belongs_to :comments
end