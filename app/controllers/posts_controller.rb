class PostsController < ApplicationController
  def index
    @post = User.find_by(id: params['user_id'])
  end

  def show
    @post = User.find_by(id: params['user_id']).posts.find_by(id: params['id'])
    @comment = Comment.where(post_id: @post)
  end
end
