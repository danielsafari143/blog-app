class PostsController < ApplicationController
  def index
    @post = User.find_by(id: params['user_id'])
  end

  def show; end
end
