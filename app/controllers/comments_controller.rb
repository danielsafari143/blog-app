class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to "/users/#{params['user_id']}/posts/#{params['post_id']}"
  end

  def new
    @comment = self
  end

  def create
    @values = params[:comment]
    poste = User.find_by(id:params['user_id']).posts.find_by(id:params['post_id'])
    @comment = poste.comments.new(text: @values['text'], author: User.find_by(id: params['user_id']),
                           post: Post.find_by(id: params['post_id']))
    puts @values
    puts params['post_id']

    return unless @comment.save
    redirect_to "/users"
  end

  def destroy
    @comment = Comment.find_by(id: params['id'])
    authorize! :delete, @comment
    @comment.destroy
    redirect_to "/users/#{params['user_id']}/posts"
  end
end
