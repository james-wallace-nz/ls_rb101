# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# Problem:
# convert string to integer without using existing methods
# input: string of digits
# output: integer

# Examples:
# '4321' => 4321
# '570' => 570

# Data Structures:
# string
# integer
# array

# Algorithim:
# 1. convert string to array of chars
# 2. iterate through array in reverse
# 3. based on character, return integer digit
# 4. convert to multiple of 10 ^ n
# 5. add to running total
# 6. return running total

def convert_char_to_digit(char)
  case char
  when '0' then 0
  when '1' then 1
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  end
end

def string_to_integer(string)
  chars = string.chars
  running_total = 0
  count = 1
  tens = 0
  while count <= chars.size
    digit = convert_char_to_digit(chars[-count])
    running_total += (digit * 10 ** tens)
    tens += 1
    count += 1
  end
  running_total
end

# Examples
puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts '--------'

DIGITS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
