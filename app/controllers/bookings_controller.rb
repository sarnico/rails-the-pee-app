class BookingsController < ApplicationController
skip_before_action :authenticate_user!, only: :home

  def index
    @bookings = Booking.all
  end

  def index
    @bookings = Booking.all
  end

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
    @user = current_user
    @toilet = Toilet.find(params[:toilet_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.toilet = @toilet
    if @booking.save
      redirect_to toilet_path(@toilet)
    else
      render "toilet"
    end
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
