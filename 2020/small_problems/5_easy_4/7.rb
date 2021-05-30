# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

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
  chars = string.chars
  digits = chars.map do |char|
    DIGITS[char]
  end
  value = 0
  digits.each do |digit|
    value = value * 10 + digit
  end
  value
end

# Examples

p string_to_integer('4321') # == 4321
p string_to_integer('570') # == 570

# Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

HEXADECIMAL_DIGITS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15

}


def hexadecimal_to_integer(hexadecimal)
  chars = hexadecimal.chars
  digits = chars.map do |char|
    HEXADECIMAL_DIGITS[char.upcase]
  end
  value = 0
  digit_values = []
  digits.each_with_index do |digit, index|
    digit_values << (digit * 16 ** (digits.size - 1 - index))
  end
  digit_values.reduce(:+)
end

# Example:

p hexadecimal_to_integer('4D9f') # == 19871