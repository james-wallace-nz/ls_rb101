# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

# int % 7 + 1

# def digits_once(multiple)
#   result = true
#   digits = multiple.to_s.chars
#   0.upto(9) do |digit|
#     result = false if digits.count(digit.to_s) > 1
#   end
#   result
# end

def digits_once(multiple)
  digits = multiple.to_s.chars
  digits == digits.uniq
end

def featured(int)
  multiple = (int / 7 + 1) * 7
  increment = 0
  loop do
    if multiple.odd? && digits_once(multiple)
      return multiple
    end
    multiple += 7
    increment += 1
    break if increment > 30_000_000
  end
  'There is no possible number that fulfills those requirements.'
end

# Examples:

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
