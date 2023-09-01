class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.all
  end

  def show
    @user = User.find_by(id: params['id'])
    render json: @user
  end
end
