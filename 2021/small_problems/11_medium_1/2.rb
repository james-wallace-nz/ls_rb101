# Write a method that can rotate the last n digits of a number. For example:

# split string at -n and rotate second half using rotate_array method


def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(int, n)
  digits = int.to_s.chars
  second = digits.slice!(-n..-1)
  second_rotated = rotate_array(second)
  rotated = digits + second_rotated
  rotated.join.to_i
end

def rotate_rightmost_digits(int, n)
  digits = int.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.
