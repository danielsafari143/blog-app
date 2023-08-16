class Comment < ApplicationRecord
    has_many :likes
    has_one :user

    def update_comments_counter(post)
      @post = Post.find_by(id: post)
      @post.comments_counter = Comment.where(post_id: @post.id).count
      @post.save
    end
end