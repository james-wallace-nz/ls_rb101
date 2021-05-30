require 'date'

# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# input: int
# output: string "hh:mm"

# hours 0 - 23
# minutes 0 - 59

SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def time_of_day(int)
  start_hours = 0
  start_minutes = 0

  time_less_days = int % MINUTES_PER_DAY
  # move_hours = time_less_days / MINUTES_PER_HOUR
  # move_minutes = int % MINUTES_PER_HOUR
  move_hours, move_minutes = time_less_days.divmod(MINUTES_PER_HOUR)

  # "#{format("%02d", move_hours)}:#{format("%02d", move_minutes)}"
  "#{format("%02d:%02d", move_hours, move_minutes)}"
end

# Examples:

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Disregard Daylight Savings and Standard Time and other complications.

puts '----'

# How would you approach this problem if you were allowed to use ruby's Date and Time classes?

def time_of_day(delta_minutes)
  time = Time.new(2020, 9, 9, 0, 0, 0)
  time += delta_minutes * SECONDS_PER_MINUTE
  time.strftime("%H:%M")
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


puts '----'

# Suppose you also needed to consider the day of week? (Assume that delta_minutes is the number of minutes
# before or after midnight between Saturday and Sunday; in such a method, a delta_minutes value of -4231
# would need to produce a return value of Thursday 01:29.)

def minutes_movement(int)
  time_less_days = int % MINUTES_PER_DAY
  move_hours, move_minutes = time_less_days.divmod(MINUTES_PER_HOUR)
  "#{format("%02d:%02d", move_hours, move_minutes)}"
end

def time_of_day(delta_minutes)
  date = DateTime.new(2020, 9, 6)
  date += delta_minutes / MINUTES_PER_DAY
  time = Time.new(2020, 9, 9, 0, 0, 0)
  time += delta_minutes * SECONDS_PER_MINUTE
  "#{date.strftime("%A")}, #{time.strftime("%H:%M")}"
end

p time_of_day(0) # == "00:00"
p time_of_day(-3) # == "23:57"
p time_of_day(35) # == "00:35"
p time_of_day(-1437) # == "00:03"
p time_of_day(3000) # == "02:00"
p time_of_day(800) # == "13:20"
p time_of_day(-4231) # == "01:29"
