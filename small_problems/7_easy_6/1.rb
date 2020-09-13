# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"
DEGREES_PER_HOUR = 360
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(angle)
  degree = angle.to_i
  minutes = ((angle - degree) * MINUTES_PER_DEGREE).round
  seconds = (((angle - degree) * MINUTES_PER_DEGREE - minutes) * SECONDS_PER_MINUTE).round
  "#{format("%01d", degree)}#{DEGREE}#{format("%02d", minutes)}'#{format("%02d", seconds)}\""
  # "#{format("%20", degree)}"
end


# Examples:

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

puts '------'

# solution

def dms(angle)
  seconds = (angle * SECONDS_PER_DEGREE).round
  degree, remaining_seconds = seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degree}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")


puts '-------'

# Our solution returns the following results for inputs outside the range 0-360:

dms(400) == %(400°00'00")
dms(-40) == %(-40°00'00")
dms(-420) == %(-420°00'00")

# Since degrees are normally restricted to the range 0-360, can you modify the code so it returns a value in the appropriate range when the input is less than 0 or greater than 360?

def dms(angle)
  seconds = (angle * SECONDS_PER_DEGREE).round
  degree, remaining_seconds = seconds.divmod(SECONDS_PER_DEGREE)
  if degree > DEGREES_PER_HOUR || degree < 0
    degree = degree % DEGREES_PER_HOUR
  end
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degree}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
