class UsersController < ApplicationController

  def show
    @user = current_user
    @bookings = @user.bookings
    @sorted_bookings = @bookings.sort { |a,b| b <=> a}
  end

end
