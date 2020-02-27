class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy, :events]

  def index
    @toilets = Toilet.all
  end

  def show
    @booking = Booking.new
    @toilet_settings = {
      min_booking_time: @toilet.min_booking_time,
      max_booking_time: @toilet.max_booking_time,
    }


    @available_periods_today = @toilet.available_booking_periods
    @toilet.bookings.where(date: Date.today.to_datetime).each{|booking|
      @available_periods_today.reject!{|apt|
        DateTime.parse(apt) == booking.date
      }
    }

    @toilet_calendar = @toilet.bookings.map { |booking|
      { start: booking.date, end: booking.date + 15.minutes}
    }

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

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end

  def toilet_params
    params.require(:toilet).permit(:name, :address, :image, :min_booking_time, :max_booking_time)
  end
end

