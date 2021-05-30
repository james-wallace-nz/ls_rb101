# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

DIGITS_ARRAY = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  result = ''
  loop do
    int, remainder = int.divmod(10)
    result.prepend(DIGITS_ARRAY[remainder])
    break if int.zero?
  end
  result
end

def signed_integer_to_string(int)
  if int.negative?
    "-#{integer_to_string(-int)}"
  elsif int.positive?
    "+#{integer_to_string(int)}"
  else
    "#{integer_to_string(int)}"
  end
end

# Examples

puts signed_integer_to_string(4321) # == '+4321'
puts signed_integer_to_string(-123) # == '-123'
puts signed_integer_to_string(0) # == '0'

# Refactor our solution to reduce the 3 integer_to_string calls to just one.

def signed_integer_to_string(int)
  sign = ''
  if int.negative?
    sign = '-'
    number = -int
  elsif int.positive?
    sign = '+'
    number = int
  else
    number = int
  end
  string = integer_to_string(number)
  string.prepend(sign) if int != 0
  string
end
