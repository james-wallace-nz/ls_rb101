# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# inputs: 3 sides integers

def triangle(side_one, side_two, side_three)
  sides_sorted = [side_one, side_two, side_three].sort
  return :invalid if side_one <= 0 || side_two <= 0 || side_three <= 0
  return :invalid if sides_sorted[0] + sides_sorted[1] <= sides_sorted[2]
  if sides_sorted[0] == sides_sorted[1] && sides_sorted[1] == sides_sorted[2]
    return :equilateral
  elsif (sides_sorted[0] == sides_sorted[1] && sides_sorted[1] != sides_sorted[2]) || (sides_sorted[1] == sides_sorted[2] && sides_sorted[0] != sides_sorted[1])
    return :isosceles
  else
    return :scalene
  end
end

def triangle(side_one, side_two, side_three)
  sides_sorted = [side_one, side_two, side_three].sort
  case
  when sides_sorted.include?(0) || sides_sorted[0] + sides_sorted[1] <= sides_sorted[2]
    :invalid
  when side_one == side_two && side_two == side_three
    :equilateral
  when side_one == side_two || side_two == side_three || side_one == side_three
    :isosceles
  else
    :scalene
  end
end


# Examples:

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
