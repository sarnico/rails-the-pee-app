class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy, :events]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @toilets = Toilet.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @user = current_user
    @toilet = Toilet.new
  end

  def create
    @user = current_user
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

  # def events
  #   # toilet_events = @toilet.bookings.map do |booking|
  #   # end
  #   toilet_events = {
  #     title: "YOUPY",
  #     start: '2020-02-26T12:00:00-00:00',
  #     end: '2020-02-26T14:00:00-00:00'
  #   }
  #   render json: toilet_events.to_json
  # end

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end

  def toilet_params
    params.require(:toilet).permit(:name, :address, :image)
  end
end

