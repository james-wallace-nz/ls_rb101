# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

CHARS = ('0'..'9').to_a

def integer_to_string(integer)
  string = ''
  number = integer
  loop do
    number, remainder = number.divmod(10)
    string.prepend(CHARS[remainder])
    break if number.zero?
  end
  string
end

# def signed_integer_to_string(integer)
#   string = integer_to_string(integer.abs)
#   if integer < 0
#     string.prepend('-')
#   elsif integer > 0
#     string.prepend('+')
#   else
#     string
#   end
# end

def signed_integer_to_string(integer)
  sign = case integer <=> 0
         when 1 then '+'
         when -1 then '-'
         else ''
         end
  "#{sign}#{integer_to_string(integer.abs)}"
end

# Examples
puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
