class UsersController < ApplicationController

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
  end

end
