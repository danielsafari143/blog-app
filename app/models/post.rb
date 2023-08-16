class Post < ApplicationRecord
    has_one :user

    def update_post_counter(name)
      @user = User.find_by(name: name)
      @user.postsCounter = Post.where(author_id: @user.id).count
      @user.save
    end
end
