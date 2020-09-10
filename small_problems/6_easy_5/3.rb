# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def split_time(time)
  time
end

def after_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)
  hours = 0 if hours == 24
  hours * MINUTES_PER_HOUR + minutes
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0

def before_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)
  hours = 1 if hours == HOURS_PER_DAY || hours == 0
  minutes = MINUTES_PER_HOUR if minutes == 0
  (hours - 1) * MINUTES_PER_HOUR + (MINUTES_PER_HOUR - minutes)
end

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0

# Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; it makes the problem more interesting.

# Disregard Daylight Savings and Standard Time and other irregularities.

puts '-------'

# How would these methods change if you were allowed to use the Date and Time classes?

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  midnight = Time.new(2020, 9, 10, 0, 0, 0)
  current_time = Time.new(2020, 9, 10, hours, minutes, 0)
  delta_minutes = (current_time - midnight) / SECONDS_PER_MINUTE % MINUTES_PER_DAY
  delta_minutes.to_i
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0

def before_midnight(time)
  delta_minutes = (MINUTES_PER_DAY - after_midnight(time) ) % MINUTES_PER_DAY

end

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0
