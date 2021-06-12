# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# 00:00 + 800 (13 hours, 20 minutes)

MINS_IN_HOUR = 60
HOURS_PER_DAY = 24
MIDNIGHT_HOUR = 0
MIDNIGHT_MINUTES = 0

def time_of_day(int)
  move_hours, move_minutes = int.divmod(MINS_IN_HOUR)
  move_days, move_hours = move_hours.divmod(HOURS_PER_DAY)

  hour = MIDNIGHT_HOUR + move_hours
  minutes = MIDNIGHT_MINUTES + move_minutes
  format_hour = sprintf("%02d", hour)
  format_minutes = sprintf("%02d", minutes)
  "#{format_hour}:#{format_minutes}"
end

# Examples:
puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

puts time_of_day(8000) == "13:20"

# Disregard Daylight Savings and Standard Time and other complications.
