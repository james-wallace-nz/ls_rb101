# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQFEET_PER_SQMETER = 10.7639
SQMETERS_PER_SQFEET = SQFEET_PER_SQMETER ** 0.5

print 'What is the length of the room (meters)?: '
length_meters = gets.chomp.to_f

print 'What is the width of the room (meters)?: '
width_meters = gets.chomp.to_f

area_meters = (length_meters * width_meters).round(2)
area_feet = (area_meters * SQFEET_PER_SQMETER).round(2)

puts "The area of the room is #{area_meters} square meters (#{area_feet} square feet)."

# Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

puts "#{length_meters * SQMETERS_PER_SQFEET}"
puts "#{width_meters * SQMETERS_PER_SQFEET}"

print 'What is the length of the room (feet)?: '
length_feet = gets.chomp.to_f

print 'What is the width of the room (feet)?: '
width_feet = gets.chomp.to_f

area_feet = (length_feet * width_feet).round(2)
area_meters = (area_feet / SQFEET_PER_SQMETER).round(2)

puts "The area of the room is #{area_feet} square feet (#{area_meters} square meters)."

sq feet
sq inches
sq cm