def format_time(time)
  time = time.split(":")[0].to_f + (time.split(":")[1].to_f/60)
end

def booking_periods(min_booking_time, max_booking_time, period_time)
  periods=[]
  setting_time = format_time(min_booking_time)
  while setting_time < format_time(max_booking_time) do
    setting_time += period_time
    periods << setting_time
  end
  return periods
end

p booking_periods("08:00","18:00",0.25)

