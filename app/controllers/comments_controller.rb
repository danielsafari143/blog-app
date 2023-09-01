class CommentsController < ApplicationController

  def index
    @post = Post.find_by(id: params['post_id'])
    
    if @post
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @post.comments }
      end
    else
      render json: { error: "Post not found" }, status: :not_found
    end

  end

  def new
    @comment = self
  end

  def create
    @values = params[:comment]
    @comment = Comment.new(text: @values['text'], author: User.find_by(id: params['user_id']),
                           post: Post.find_by(id: params['post_id']))
    return render json: { message: "Error" }, status: :bad_request unless @comment.save
    render json: { message: "Created" }, status: :created
  end

  def destroy
    @comment = Comment.find_by(id: params['id'])
    authorize! :delete, @comment
    @comment.destroy
    redirect_to "/users/#{params['user_id']}/posts"
  end
end
