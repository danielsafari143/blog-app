class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments
    
    def get_post(name)
      @user = User.find_by(name: name)
      @posts = Post.where(author_id: @user.id).limit(3)
    end
end
