class ChangeTypeMinMAxBookTime < ActiveRecord::Migration[5.2]
  def change
    change_column :toilets, :min_booking_time, :time
    change_column :toilets, :max_booking_time, :time
  end
end
