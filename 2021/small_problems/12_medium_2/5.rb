# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# PROBLEM

# Determine the type of triangle based on the number arguments
# Input: three Integers/Floats
# Ouput: symbol for triangle type or :invalid

# DATA STRUCTURES

# Number (Integer/Float)
# Array

# ALGORITHM

# - check sum of two shortest sides is greater than length of longest side.
# - check all sides greater than `0`

# - check arguments are for a valid triangle
# - determine type of triangle based on criteria
# - return type of triangle

# CODE

def valid_triangle?(side_one, side_two, side_three)
  sides = [side_one, side_two, side_three]
  return false if sides.any? { |n| n <= 0 }
  return false if sides.min(2).sum < sides.max
  true
end

def triangle(side_one, side_two, side_three)
  return :invalid unless valid_triangle?(side_one, side_two, side_three)

  return :equilateral if side_one == side_two && side_two == side_three
  return :isosceles if side_one == side_two || side_two == side_three || side_one == side_three
  return :scalene
end

# Examples:

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
