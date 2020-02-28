class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update, :destroy, :events]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @toilets = Toilet.all
  end

  def show
    @booking = Booking.new
    @toilet_settings = {
      min_booking_time: @toilet.min_booking_time.strftime("%H:%M"),
      max_booking_time: @toilet.max_booking_time.strftime("%H:%M"),
    }

    @available_periods_today = @toilet.available_booking_periods.map{|t| t.strftime("%H:%M")}

    @toilet.bookings.each{|booking|
      @available_periods_today.reject!{|apt|
        apt == booking.date.strftime("%H:%M")
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
    if @toilet.save
      redirect_to user_path(current_user)
    else
      render :new
    end
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

