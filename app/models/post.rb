class Post < ApplicationRecord
    has_one :user

    def update_post_counter(name)
      @user = User.find_by(name: name)
      @user.postsCounter = Post.where(author_id: @user.id).count
      @user.save
    end

    def get_comments(post)
      @post = Post.find_by(id: post)
      @comments = Comment.where(post_id: @post.id).limit(5)
    end
end
