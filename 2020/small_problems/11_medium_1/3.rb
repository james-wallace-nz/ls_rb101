# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

# algorithm:
# 1) rotate size - n where n is number of iterations

# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# def rotate_rightmost_digits(number, n_digits)
#   digits = number.to_s.chars
#   rotate = digits[-n_digits..-1]
#   rotate = rotate_array(rotate)
#   rotated = digits[0..-n_digits -1] + [rotate].flatten
#   rotated.join('').to_i
# end

# def max_rotation(number)
#   n_digits = number.to_s.size
#   result = number
#   (n_digits - 1).times do
#     result = rotate_rightmost_digits(result, n_digits)
#     n_digits -= 1
#   end
#   result
# end

# Example:

# p max_rotation(735291)  == 321579
# p max_rotation(3)  == 3
# p max_rotation(35)  == 53
# p max_rotation(105)  == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146)  == 7_321_609_845

puts '-----'

# Assume you do not have the rotate_rightmost_digits or rotate_array methods. How would you approach this problem? Would your solution look different? Does this 3 part approach make the problem easier to understand or harder?

# Without the rotate_array and rotate_rightmost_digits methods I would have to break this problem down into its component parts and build those methods anyway.
# The 3 part approach makes this much easier to understand

# There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros. Can you create a solution that preserves zeros?

# The edge case would occur when the 0s are removed by Ruby when they are leading zeros.


def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_chars(number, n_digits)
  digits = number.chars
  rotate = digits[-n_digits..-1]
  rotate = rotate_array(rotate)
  rotated = digits[0..-n_digits -1] + [rotate].flatten
  rotated.join('')
end

def max_rotation(number)
  result = number.to_s
  n_digits = result.size
  (n_digits - 1).times do
    result = rotate_rightmost_chars(result, n_digits)
    n_digits -= 1
  end
  result.to_i
end

# Example:

p max_rotation(735200091) # == 321579
p max_rotation(300) # == 3
p max_rotation(30005) # == 53
p max_rotation(10005) # == 15 # the leading zero gets dropped
p max_rotation(800_703_529_146) # == 7_321_609_845
