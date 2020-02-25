class BookingsController < ApplicationController

  # def index
  #   @bookings = Booking.all
  # end

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(params[:user_id])
    @toilet = Toilet.find(params[:toilet_id])
    @booking.user = @user
    @booking.toilet = @toilet
    @booking.save
    redirect_to user_path(@user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

end
