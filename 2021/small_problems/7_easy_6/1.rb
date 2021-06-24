# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def normalise_degrees(degrees)
  degrees += 360 while degrees < 0
  degrees -= 360 while degrees > 360
  degrees
end

def dms(float)
  degrees = float.to_i
  remainder = ((float - degrees) * MINUTES_PER_DEGREE).round(2)
  minutes = remainder.to_i
  seconds = ((remainder - minutes) * SECONDS_PER_MINUTE).round(0)
  degrees = normalise_degrees(degrees)
  # "#{degrees}#{DEGREE}#{format("%02d", minutes)}'#{format("%02d", seconds)}\""
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
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

# You may use this constant to represent the degree symbol:

puts dms(400) == %(400°00'00")
puts dms(-40) == %(-40°00'00")
puts dms(-420) == %(-420°00'00")

puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
