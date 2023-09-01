class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.all
  end

  def show
    @user = User.find_by(id: params['id'])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
end
