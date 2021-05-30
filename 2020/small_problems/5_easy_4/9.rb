# In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

DIGITS = {
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

def integer_to_string(int)
  divisor = 1
  digits = []
  loop do
    divisor *= 10
    digit = int % divisor
    digit /= (divisor / 10) if divisor > 10
    digits << DIGITS[digit]
    break if int % divisor == int
  end
  digits.reverse.join('')
end

# Examples

p integer_to_string(4321) # == '4321'
p integer_to_string(0) # == '0'
p integer_to_string(5000) # == '5000'

DIGITS_ARRAY = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# Solution

def integer_to_string(int)
  result = ''
  loop do
    int, remainder = int.divmod(10)
    result.prepend(DIGITS_ARRAY[remainder])
    break if int == 0
  end
  result
end

p integer_to_string(4321) # == '4321'
p integer_to_string(0) # == '0'
p integer_to_string(5000) # == '5000'
