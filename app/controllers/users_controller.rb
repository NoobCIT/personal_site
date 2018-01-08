class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order('created_at DESC').page(params[:page])
  end

end
