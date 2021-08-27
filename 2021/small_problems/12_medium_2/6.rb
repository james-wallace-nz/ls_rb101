# A triangle is classified as follows:

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

# PROBLEM:
# Return the type of triangle as a symbol based on angles passed in as arguments


# DATA STRUCTURES

# Integer angles
# Array of angles

# ALGORITHIM:

# - Check if valid triangle?
#   - sum of angles must be `180`
#   - all angles must be > `0`
#   - return boolean
# - if invalid, return `:invalid`
# - check if one angle is `90` then return `:right`
# - check if all angles are less than `90` then return `:acute`
# - check if one angle is greater than `90` then return `:obtuse:
# - otherwise return `:invalid`

# CODE:

def valid_triangle?(angles)
  return false if angles.any? { |n| n <= 0 }
  return false unless angles.sum == 180
  true
end

def triangle(angle_one, angle_two, angle_three)
  angles = [angle_one, angle_two, angle_three]
  return :invalid unless valid_triangle?(angles)
  return :right if angles.any? { |n| n == 90 }
  return :acute if angles.all? { |n| n < 90 }
  return :obtuse if angles.any? { |n| n > 90 }
  :invalid
end


# EXAMPLES:

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
