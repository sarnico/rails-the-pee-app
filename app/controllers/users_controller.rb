class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    #   redirect_to user_path(user)
    # else
    #   render :create
    end
  end

  def destroy
    @user.destroy
    # redirect_to
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
