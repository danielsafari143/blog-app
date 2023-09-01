class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    puts
    redirect_to "/users/#{params['user_id']}/posts/#{params['post_id']}"
  end

  def new
    @comment = self
  end

  def create
    @values = params[:comment]
    @comment = Comment.new(text: @values['text'], author: User.find_by(id: params['user_id']),
                           post: Post.find_by(id: params['post_id']))
    return unless @comment.save

    redirect_to "/users/#{params['user_id']}/posts/#{params['post_id']}"
  end

  def destroy
    @comment = Comment.find_by(id: params['id'])
    authorize! :delete, @comment
    @comment.destroy
    redirect_to "/users/#{params['user_id']}/posts"
  end
end
