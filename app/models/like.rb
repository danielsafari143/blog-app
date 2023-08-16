class Like < ApplicationRecord
    has_one :users
    has_one :comments

    def update_likes_counter(post)
      @post = Post.find_by(id: post)
      @post.likes_counter = Like.where(post_id: @post.id).count
      @post.save
    end
end