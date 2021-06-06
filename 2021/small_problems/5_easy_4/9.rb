# In the previous tws o exer, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

# algo:
# 1. count = 0. loop until integer % 10**count == integer
# 2.

CHARS = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9'
}

def integer_to_string(integer)
  return CHARS[integer] if integer.zero?

  count = 0
  chars = []
  until integer % 10**count == integer
    digit = integer % 10**(count + 1) / (10**count)
    chars.unshift(CHARS[digit])
    count += 1
  end
  chars.join
end

# Examples
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
