class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy]

  def index
    @toilets = Toilet.all
  end

  def show
    @booking = Booking.new

  end

  def new
    @user = User.find(params[:user_id])
    @toilet = Toilet.new
  end

  def create
    @user = User.find(params[:user_id])
    @toilet = Toilet.new(toilet_params)
    @toilet.user = @user
    @toilet.save
    # if @restaurant.save
    #   redirect_to restaurants_path
    # else
    #   render :new
    # end
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
    @toilet.update(toilet_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @toilet.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end

  def toilet_params
    params.require(:toilet).permit(:name, :address)
  end
end

